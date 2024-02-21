import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_scan_bluetooth/flutter_scan_bluetooth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class ContactTracing extends StatefulWidget {
  ContactTracing({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ContactTracing> {
  Future<bool> checkIfInfected() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    String latestresult = (await FirebaseDatabase.instance
            .reference()
            .child('users')
            .child(firebaseUser.uid)
            .child('status')
            .child('status')
            .once())
        .value;
    print("-----------------------------------------------------------");
    print(latestresult);
    print("wait");
    if (latestresult == 'Infected') {
      setState(() {
        isSwitched = true;
      });
      print('lol');
      return true;
    } else {
      setState(() {
        isSwitched = false;
      });
      return false;
    }
  }

  final dbreference = FirebaseDatabase.instance.reference();
  // ignore: non_constant_identifier_names
  String Status = "Your Status", btid = "Your Id";
  // ignore: non_constant_identifier_names
  String bluetooth_add = 'Your bid';
  // ignore: non_constant_identifier_names
  Color status_color = Colors.greenAccent;
  // ignore: non_constant_identifier_names
  Color start_stop_color = Colors.greenAccent;
  // ignore: non_constant_identifier_names
  String start_stop_string = "Start";
  // String statusnew = '';
  List data = [];
  String status = "Safe";
  // ignore: unused_field
  bool _scanning = false;
  FlutterScanBluetooth _bluetooth = FlutterScanBluetooth();
  bool isSwitched;

  Widget getSwitch() {
    print(isSwitched.toString() +
        "--------------------------------------------------------------------");
    if (isSwitched != null) {
      return Switch(
        value: isSwitched,
        onChanged: (value) async {
          setState(() {
            isSwitched = value;
            print(isSwitched);
          });
          if (isSwitched) {
            // ignore: non_constant_identifier_names
            var date_infected = new DateTime.now();
            // ignore: non_constant_identifier_names
            var date_inf = date_infected.day.toString() +
                "-" +
                date_infected.month.toString() +
                "-" +
                date_infected.year.toString();
            var infectedBluetoothId = await bluetooth();
            // ignore: unused_local_variable
            var infectedBluetoothStatus = await infected(date_inf);
            final DatabaseReference dbref =
                FirebaseDatabase.instance.reference();
            dbref
                .child('infected')
                .child('bluetooth_id')
                .child(infectedBluetoothId)
                .set({'date': date_inf});
          } else {
            // ignore: non_constant_identifier_names
            var date_a = new DateTime.now();
            // ignore: non_constant_identifier_names
            var date_ = date_a.day.toString() +
                "-" +
                date_a.month.toString() +
                "-" +
                date_a.year.toString();
            var firebaseUser = await FirebaseAuth.instance.currentUser();
            // ignore: unused_local_variable
            final Future<void> dbref = FirebaseDatabase.instance
                .reference()
                .child('users')
                .child(firebaseUser.uid)
                .child('status')
                .set({'date': date_, 'status': 'Safe'});
          }
        },
        activeTrackColor: Colors.blue[200],
        activeColor: Colors.blue,
      );
    } else {
      return Switch(value: false, onChanged: (val) {});
    }
  }

  void sendData() async {
    debugPrint(status);
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    // ignore: non_constant_identifier_names
    var date_var = new DateTime.now();
    final DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference(); //.child(firebaseUser.uid);
    for (var i = 0; i < data.length; i++) {
      print(data[i]);
      databaseReference
          .child("users")
          .child(firebaseUser.uid)
          .child("bluetooth_id")
          .child(data[i])
          .set({
        'date': (date_var.day.toString() +
            "-" +
            date_var.month.toString() +
            "-" +
            date_var.year.toString())
      });
    }
    // var date = date_var.day.toString() +
    //     "-" +
    //     date_var.month.toString() +
    //     "-" +
    //     date_var.year.toString();
    // databaseReference
    //     .child("users")
    //     .child(firebaseUser.uid)
    //     .child("status")
    //     .set({'status': status, 'date': date});
    final DatabaseReference dbref = FirebaseDatabase.instance.reference();
    final datasnapshot = (await FirebaseDatabase.instance
            .reference()
            .child('users')
            .child(firebaseUser.uid)
            .child('organization')
            .once())
        .value;
    if (datasnapshot == null) {
      dbref
          .child('users')
          .child(firebaseUser.uid)
          .child("organization")
          .set({'organization': 'Default'});
    }
  }

  void bluetoothUpdate() async {
    try {
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      String bluetoothUpd = (await FirebaseDatabase.instance
              .reference()
              .child('users')
              .child(firebaseUser.uid)
              .child('personal_details')
              .child('personal_bid')
              .once())
          .value;
      if (bluetoothUpd == 'null') {
        setState(() {
          bluetooth_add = '';
        });
      } else {
        setState(() {
          bluetooth_add = bluetoothUpd;
        });
      }
    } catch (e) {
      setState(() {
        bluetooth_add = "Please Edit ";
      });
    }
  }

  void statusUpdate() async {
    // DataSnapshot statusResult = await FirebaseDatabase.instance.reference().child('users').child(firebaseUser.uid).child('status').child('status').once();
    // String latest_result = statusResult.value.toString();
    // debugPrint("STATUS IS - "+latest_result);
    try {
      var firebaseUser = await FirebaseAuth.instance.currentUser();
      String latestresult = (await FirebaseDatabase.instance
              .reference()
              .child('users')
              .child(firebaseUser.uid)
              .child('status')
              .child('status')
              .once())
          .value;
      if (latestresult == "null") {
        setState(() {
          status = "Safe";
        });
      } else {
        setState(() {
          status = latestresult;
        });
      }
    } catch (e) {
      setState(() {
        status = "Safe";
      });
    }
  }
  // void statusUpdate() async {
  //   //plan1
  //   // var firebaseUser = await FirebaseAuth.instance.currentUser();
  //   // DataSnapshot statusResult = await FirebaseDatabase.instance
  //   //     .reference()
  //   //     .child('users')
  //   //     .child(firebaseUser.uid)
  //   //     .child('status')
  //   //     .child('status')
  //   //     .once();
  //   // String latestresult = statusResult.value.toString();
  //   // debugPrint("STATUS IS - " + latestresult);
  //   // if (latestresult == 'null') {
  //   //   setState(() {
  //   //     status = "Safe";
  //   //   });
  //   // } else {
  //   //   setState(() {
  //   //     status = latestresult;
  //   //   });
  //   // }
  //   //plan 2
  //   // String latestresult = (await FirebaseDatabase.instance
  //   //         .reference()
  //   //         .child('users')
  //   //         .child(firebaseUser.uid)
  //   //         .child('status')
  //   //         .child('status')
  //   //         .once())
  //   //     .value;
  //   //plan 3
  // }

  void scanAgain() {
    _bluetooth.devices.listen((device) async {
      setState(() async {
        data.add('${device.address}');
        sendData();
      });
    });
  }


  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin(); //Notification code

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }
  
  Future showNotification() async{

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    '123', 'CovidProtectCT', 'CT Notification Channel',
    importance: Importance.Max, priority: Priority.High);

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, 'CovidProtect', 'Contact Tracing Started', platformChannelSpecifics,
        payload: 'Default_Sound');
  }

  @override
  void initState() {
    super.initState();


    //Notification code--------------------------------------------------------------

    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = IOSInitializationSettings(); //Not Initialised for IoS
    
    var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: selectNotification);






     
    //-------------------------------------------------------------------------------


    checkIfInfected();
    statusUpdate();
    bluetoothUpdate();
    const fiveSeconds = const Duration(seconds: 5);
    const tenSeconds = const Duration(seconds: 10);
    Timer.periodic(fiveSeconds, (Timer t) => statusUpdate());
    Timer.periodic(fiveSeconds, (Timer t) => bluetoothUpdate());
    Timer.periodic(tenSeconds, (Timer t) => scanAgain());
    _bluetooth.devices.listen((device) async {
      setState(() async {
        data.add('${device.address}');
        sendData();
      });
    });
    _bluetooth.scanStopped.listen((device) {
      setState(() {
        _scanning = false;
        // _data += 'scan stopped\n';
        // _scanning = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final firebaseUser = await FirebaseAuth.instance.currentUser();

    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                width: 60,
                height: 60,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Contact Tracing",
                style: TextStyle(
                    fontFamily: 'Courgette',
                    fontSize: MediaQuery.of(context).size.width / 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    height: 200,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: status_color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Status\n",
                          style: TextStyle(
                              fontFamily: 'Fondamento',
                              fontSize: MediaQuery.of(context).size.width / 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          status ?? 'Safe',
                          style: TextStyle(
                              fontFamily: 'Arima_Madurai',
                              fontSize: MediaQuery.of(context).size.width / 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    height: 200,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Bluetooth Address\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Fondamento',
                              fontSize: MediaQuery.of(context).size.width / 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          // "hi",
                          bluetooth_add ?? 'Enter Bluetooth Id',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Arima_Madurai',
                              fontSize: MediaQuery.of(context).size.width / 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // ADD your Bt address  TextField here-----------------------------------------------
              width: MediaQuery.of(context).size.width - 25,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.limeAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditBluetoothId()),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Edit Bluetooth Address",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 50),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditBluetoothId()),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    "Are you Covid19 Positive ? ",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  getSwitch(),
                  SizedBox(height: 20),
                  //Add the Toggle button here------------------------------------------------------------------
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                  color: start_stop_color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  start_stop_string ?? 'default',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              onTap: () async {
                if (start_stop_color == Colors.greenAccent) {
                  await _bluetooth.startScan(pairedDevices: false);
                  debugPrint("scanning started");

                  showNotification();

                  setState(() {
                    _scanning = true;
                    start_stop_color = Colors.deepOrange;
                    start_stop_string = "Stop Scan";
                  });
                } else {
                  await _bluetooth.stopScan();
                  debugPrint("scanning stoped");

                  await flutterLocalNotificationsPlugin.cancel(0);

                  setState(() {
                    start_stop_color = Colors.greenAccent;
                    start_stop_string = "Start Scan";
                  });
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}

// ignore: non_constant_identifier_names
infected(date_inf) async {
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  final DatabaseReference dbref = FirebaseDatabase.instance.reference();
  dbref
      .child('users')
      .child(firebaseUser.uid)
      .child('status')
      .set({'status': 'Infected', 'date': date_inf});
}

bluetooth() async {
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  String infectedVariable = (await FirebaseDatabase.instance
          .reference()
          .child('users')
          .child(firebaseUser.uid)
          .child('personal_details')
          .child('personal_bid')
          .once())
      .value;
  debugPrint("ye vala" + infectedVariable);
  return infectedVariable;
}

class EditBluetoothId extends StatefulWidget {
  @override
  _EditBluetoothIdState createState() => _EditBluetoothIdState();
}

class _EditBluetoothIdState extends State<EditBluetoothId> {
  // ignore: non_constant_identifier_names
  String bluetooth_add;
  String status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Tracing"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  width: 60,
                  height: 60,
                  child: IconButton(
                    icon: Icon(
                      Icons.people,
                      color: Colors.blue,
                    ),
                    iconSize: 50,
                    onPressed: () {},
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Contact Tracing",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text('Enter your Bluetooth Address'),
                      SizedBox(height: 10),
                      Text(
                        "( Go to Settings -> About Phone/device/tablet -> Status -> Bluetooth Address )",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          print("Text : $text");
                          setState(() {
                            bluetooth_add = text;
                            status = "Safe";
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'eg. 04:c8:07:10:32:36',
                        ),
                      ),
                      RaisedButton(
                        onPressed: () async {
                          // ignore: non_constant_identifier_names
                          var date_var = new DateTime.now();
                          var date = date_var.day.toString() +
                              "-" +
                              date_var.month.toString() +
                              "-" +
                              date_var.year.toString();
                          var firebaseUser =
                              await FirebaseAuth.instance.currentUser();

                          await FirebaseDatabase.instance
                              .reference()
                              .child("users")
                              .child(firebaseUser.uid)
                              .child('personal_details')
                              .set({
                            'personal_bid': bluetooth_add,
                            'date': date
                          });

                          print("done" + bluetooth_add);
                          Navigator.pop(context);
                          // databaseReference.update({"bluetooth_add" : bluetooth_add});

                          //   databaseReference
                          //       .child(bluetooth_add)
                          //       .set({'date': date});
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  )
                  // ADD your Bt address  TextField here-----------------------------------------------

                  ),
            ],
          ),
        ),
      ),
    );
  }
}
