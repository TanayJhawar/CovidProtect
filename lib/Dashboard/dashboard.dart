import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:sakecblue/AIChatbot/chat.dart';
import 'package:sakecblue/Background/background.dart';
import 'package:sakecblue/Chatbot/first.dart';
import 'package:sakecblue/FAQ/faq_grid.dart';
import 'package:sakecblue/Health/mentalhealth/healthcenter.dart';
import 'package:sakecblue/Health/plasmadonation/plasmamain.dart';
import 'package:sakecblue/Health/seekhelp/doctor.dart';
import 'package:sakecblue/Heatmap/heatmap.dart';
import 'package:sakecblue/Nearby/dropdown_city.dart';
import 'package:sakecblue/Precaution/dodonts.dart';
import 'package:sakecblue/Qrcode/Qrscan.dart';
import 'package:sakecblue/Stats/graph.dart';
import 'package:sakecblue/TermsAndCondition/agreement1.dart';
import 'package:sakecblue/TermsAndCondition/terms1.dart';
import 'package:sakecblue/Tracing/screens/home.dart';
//import 'package:sakecblue/sidebar/sidenavigation.dart';
import '../page_transition.dart';
import 'package:sakecblue/ui/pages/aushomepage.dart';
import 'package:sakecblue/ui/pages/frahomepage.dart';
import 'package:sakecblue/ui/pages/erahomepage.dart';
import 'package:sakecblue/ui/pages/homepage.dart';
import 'package:sakecblue/ui/pages/indhomepage.dart';
import 'package:sakecblue/ui/pages/ushomepage.dart';
import '../AdminApp/adminfirst.dart';
import '../Profile/About.dart';
import '../Login/Login2/screens/login/login.dart';
import '../Profile/abt.dart';

class Dash extends StatefulWidget {
  final String selfAssesResult;
  Dash({this.selfAssesResult});
  @override
  State<StatefulWidget> createState() {
    return _DashState();
  }
}

class _DashState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Dash ${widget.selfAssesResult}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CovidProtect",
      home: Home(
        selfRes: widget.selfAssesResult,
      ),
    );
  }
}

String riskValue = "";

class Home extends StatefulWidget {
  final String selfRes;

  Home({this.selfRes});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Home ${widget.selfRes}");
    return WillPopScope(
      onWillPop: () async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Column(
            children: <Widget>[
              Image.asset(
                'images/Dashboard/exit1.jpeg',
                height: 80,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Are you sure you want to exit?",
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: new Text(
                "Yes",
                style: TextStyle(
                  color: Color(0xFF3b7dfb),
                ),
              ),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
            FlatButton(
              child: new Text(
                "No",
                style: TextStyle(
                  color: Color(0xFF3b7dfb),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        ),
      ),
      child: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "CovidProtect",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 15),
              child: Material(
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRightWithFade,
                          duration: Duration(milliseconds: 600),
                          child: ScanPage()),
                    );
                  },
                  child: Image.asset(
                    "images/qr.jpg",
                  ),
                ),
                color: Colors.black54,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: CustomPaint(
          painter: MainBackground(),
          child: BaseLayout(selfAssessRes: widget.selfRes),
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Chat()));
          },
          child: Icon(Icons.chat_bubble_outline),
          backgroundColor: Color(0xFF3b7dfb),
        ),
      ),
    );
  }
}

class BaseLayout extends StatefulWidget {
  final String selfAssessRes;

  BaseLayout({this.selfAssessRes});

  @override
  State<StatefulWidget> createState() {
    return _Baselayout();
  }
}

class _Baselayout extends State<BaseLayout> {
  bool pressAttention1 = true;
  bool pressAttention2 = false;
  bool pressAttention3 = false;

  @override
  Widget build(BuildContext context) {
    debugPrint("Base Layout ${widget.selfAssessRes}");
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0, top: 8.0),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[],
              ),
            ],
          ),
          Safe(
            result: widget.selfAssessRes,
          ),
          tracker(),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Utilities",
                  style: TextStyle(
                      fontSize: 23.0,
                      fontFamily: 'Cambria',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Asses(),
                  videos(),
                  plasma(),
                  faq(),
                ],
              ),
              Column(
                children: <Widget>[
                  heat_map(),
                  NearbyYourFinder(),
                  doc(),
                  dos_dont(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class tracker extends StatelessWidget {
  String _selectedCountry = null;
  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = ["Australia", "UK", "US", "France", "Canada", "India"];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3.0,
                    ),
                  ]),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.235,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        DropdownButton(
                            value: _selectedCountry,
                            items: _dropDownItem(),
                            onChanged: (value) {
                              _selectedCountry = value;
                              switch (value) {
                                case "Australia":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AusHomePage()),
                                  );
                                  break;
                                case "UK":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EraHomePage()),
                                  );
                                  break;
                                case "US":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UsHomePage()),
                                  );
                                  break;
                                case "France":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FraHomePage()),
                                  );
                                  break;
                                case "Canada":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CaHomePage()),
                                  );
                                  break;
                                case "India":
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IndHomePage()),
                                  );
                                  break;
                              }
                            },
                            hint: Text(
                              'India',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: null,
                              ),
                            ),
                            underline: Container(
                              height: 1.0,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0))),
                            )),
                      ],
                    ),
                  ),
                  Graphone(),
                ],
              ))
        ],
      ),
    );
  }
}

class Safe extends StatefulWidget {
  final String result;

  Safe({this.result});

  @override
  State<StatefulWidget> createState() {
    return _safe();
  }
}

// ignore: camel_case_types
class _safe extends State<Safe> {
  String res = "";
  String location = "";
  DateTime date;

  @override
  void initState() {
    this.fetchingData();
    super.initState();
  }

  // For fetching risk value
  fetchingData() async {
    print("Inside fetching data");
    var firebaseUser = await FirebaseAuth.instance.currentUser();
//    final dbRef = FirebaseDatabase.instance.reference().child("pets");
    riskValue = (await FirebaseDatabase.instance
                .reference()
                .child('selfAssessmentUser')
                .child(firebaseUser.uid)
                .child("result")
                .once())
            .value ??
        "Low Risk";
    print("Risk Value is " + riskValue);

    setState(() {
      if (riskValue == null) {
        res = "You are Safe";
        print('if risk value');
      } else {
        Row(children: <Widget>[
          Image(
            alignment: Alignment.centerLeft,
            image: AssetImage('images/qr.jpg'),
          ),
          Wrap(children: <Widget>[
            Text(
              res = "You are at " + riskValue,
              style: TextStyle(
                fontSize: 5.0,
              ),
            ),
          ]),
        ]);

        print("Hello " + res);
      }
    });
  }

  var containercolor;

  // ignore: non_constant_identifier_names
  Widget SelfAssesment() {
    if (riskValue == null || riskValue == "Low Risk") {
      containercolor = [
        Colors.white,
        Colors.green[100],
        Colors.green[300],
        Colors.green[400]
      ];
    } else if (riskValue == "Medium Risk") {
      containercolor = [
        Colors.white,
        Colors.orange[100],
        Colors.orange[300],
        Colors.orange[400]
      ];
    } else if (riskValue == "High Risk") {
      containercolor = [
        Colors.white,
        Colors.red[100],
        Colors.red[300],
        Colors.red[400]
      ];
    } else {
      containercolor = [
        Colors.white,
        Colors.green[100],
        Colors.green[300],
        Colors.green[400],
      ];
    }

    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Wrap(children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.11,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.15, 0.4, 0.7, 1],
                      colors: containercolor)
//        image: DecorationImage(
//          image: image(),
//          fit: BoxFit.fill,
//        ),
                  ),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 10.0),
                      child: new Container(
                        child: new Image.asset(
                          'images/Dashboard/undraw_speed_test_wxl0.png',
                          height: 60.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                          res ?? "You are safe",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              )
//      child: RaisedButton(
//
//        onPressed: () {
////          convertLocationToString();
////          Navigator.push(
////              context,
////              MaterialPageRoute(
////                  builder: (context) => FirstQuestion(
////                      startTime: formatTimeOfDay(TimeOfDay.now()),
////                      location: location)));
//        },
//        child: Text(
//          res ?? "You are safe",
//          style: TextStyle(fontSize: 25),
//        ),
//        elevation: 3.0,
////        color: containercolor,
//        shape: RoundedRectangleBorder(
//          borderRadius: new BorderRadius.circular(10.0),
//        ),
//      ),
              ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
//    debugPrint("Safe ${widget.result}");
//    fetchingData();

    return Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: SelfAssesment());
  }

  getTimeStamp() {
    date = DateTime.now();
    print(DateTime.now());
  }

  Future<String> userLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    return position.toString();
    //convertLocationToString();
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    print(format.format(dt));
    return format.format(dt);
  }

  void convertLocationToString() {
    userLocation().then((value) {
      setState(() {
        print(value);
        location = value;
        print("users location tracked " + location);
      });
    });
  }
}

class Asses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return asses();
  }
}

// ignore: camel_case_types
class asses extends State<Asses> {
  String location = "";
  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 2.0, left: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.27,
        child: RaisedButton(
          onPressed: () {
            convertLocationToString();
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    duration: Duration(milliseconds: 600),
                    child: FirstQuestion(
                        startTime: formatTimeOfDay(TimeOfDay.now()),
                        location: location)));
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  alignment: Alignment.center,
                  image: AssetImage('images/Dashboard/assess.png'),
                ),
                // Icon('images/Dashboard/contact.svg', color: Colors.green[800], size: 40),
                AutoSizeText(
                  "Assess Yourself",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ]),
          elevation: 3.0,
          color: Colors.lightBlue[50],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  getTimeStamp() {
    date = DateTime.now();
    print(DateTime.now());
  }

  Future<String> userLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    return position.toString();
    //convertLocationToString();
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    print(format.format(dt));
    return format.format(dt);
  }

  void convertLocationToString() {
    userLocation().then((value) {
      setState(() {
        print(value);
        location = value;
        print("users location tracked " + location);
      });
    });
  }
}

// ignore: camel_case_types
class contact_tracing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 2.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        height: MediaQuery.of(context).size.height * 0.28,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    duration: Duration(milliseconds: 600),
                    child: ContactTracing()));
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  alignment: Alignment.center,
                  image: AssetImage('images/Dashboard/contact.png'),
                ),
                // Icon('images/Dashboard/contact.svg', color: Colors.green[800], size: 40),
                AutoSizeText(
                  "Contact Tracing",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ]),
          elevation: 3.0,
          color: Colors.blue[200],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class heat_map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5, bottom: 2.0, right: 5),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.43,
          height: MediaQuery.of(context).size.height * 0.22,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      duration: Duration(milliseconds: 600),
                      child: HeatMap()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  alignment: Alignment.center,
                  image: AssetImage('images/Dashboard/heatmap.png'),
                ),
                Text(
                  "HeatMap",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            elevation: 3.0,
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
            ),
          ),
        ));
  }
}

// ignore: camel_case_types
class videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.0, bottom: 2.0, left: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.22,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    duration: Duration(milliseconds: 600),
                    child: HealthCen()));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(
                alignment: Alignment.center,
                image: AssetImage('images/Dashboard/video.png'),
              ),
              Text(
                "Videos",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          elevation: 3.0,
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

class NearbyYourFinder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NearbyYouFinderState();
  }
}

class _NearbyYouFinderState extends State<NearbyYourFinder> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  String location = "";
  Position position;
  String _currentAddress = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.0, bottom: 2.0, right: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.27,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    duration: Duration(milliseconds: 600),
                    child: App(
                      location: _currentAddress,
                    ))
//                MaterialPageRoute(
//                  builder: (context) => App(
//                    location: _currentAddress,
//                  ),
//                )
                );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(
                alignment: Alignment.center,
                image: AssetImage('images/Dashboard/nearby.png'),
              ),
              Text(
                "Nearby",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          elevation: 3.0,
          color: Colors.lightBlue[50],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Future<String> userLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    _getAddressFromLatLng();
    return position.toString();
    //convertLocationToString();
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          position.latitude, position.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.locality}";
      });
      print(_currentAddress);
    } catch (e) {
      print(e);
    }
  }

  void convertLocationToString() {
    userLocation().then((value) {
      setState(() {
        print(value);
        location = value;
        print("users location tracked " + location);
      });
    });
  }
}

// ignore: camel_case_types
class plasma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0, bottom: 2.0, left: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.27,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    duration: Duration(milliseconds: 600),
                    child: Plasma()));
          },
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  alignment: Alignment.center,
                  image: AssetImage('images/Dashboard/donate.png'),
                ),
                // Icon('images/Dashboard/contact.svg', color: Colors.green[800], size: 40),
                AutoSizeText(
                  "Plasma Donate",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ]),
          elevation: 3.0,
          color: Colors.blue[50],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class doc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 12, bottom: 2.0, right: 5),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.43,
          height: MediaQuery.of(context).size.height * 0.22,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      duration: Duration(milliseconds: 600),
                      child: Doc()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(
                  alignment: Alignment.center,
                  image: AssetImage('images/Dashboard/scheduling.png'),
                ),
                Text(
                  "E Scheduling",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            elevation: 3.0,
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
            ),
          ),
        ));
  }
}

// ignore: camel_case_types
class dos_dont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.0, bottom: 2.0, right: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.27,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    duration: Duration(milliseconds: 600),
                    child: Dod()));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(
                alignment: Alignment.center,
                image: AssetImage('images/Dashboard/distance.png'),
              ),
              Text(
                "Precautions",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          elevation: 3.0,
          color: Colors.lightBlue[50],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13.0, bottom: 2.0, left: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.22,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    duration: Duration(milliseconds: 600),
                    child: FaqGrid()));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(
                alignment: Alignment.center,
                image: AssetImage('images/Dashboard/faq.png'),
              ),
              Text(
                "FAQs",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          elevation: 3.0,
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

class NavDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavDrawer();
  }
}

class _NavDrawer extends State<NavDrawer> {
  String abc;
  var uuuid;

  Future<String> getdata() async {
    var firebaseUser1 = await FirebaseAuth.instance.currentUser();
    uuuid = firebaseUser1.email;
    if (uuuid != null) {
      uuuid = firebaseUser1.email;
    } else {
      uuuid = firebaseUser1.phoneNumber;
    }
    return uuuid;
  }

  @override
  void initState() {
    getdata().then((results) {
      setState(() {
        if (results.isEmpty) {
          debugPrint("Inside if ${abc}");
          abc = "Hello";
        } else {
          debugPrint("Inside Else ${abc}");
          abc = results;
        }
        // abc = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
//      child: abc == null
//          ? Container(
//        child: Center(
//          child: Text("Loading..."),
//        ),
//      )
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 115,
            color: Color(0xFF3b7dfb),
            child: ListTile(
              contentPadding: EdgeInsets.only(top: 35, left: 10),
              title: Text(
                abc != null ? abc : "User",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
//              subtitle: Text(
//                abc,
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 18,
//                ),
//              ),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                radius: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(Icons.supervisor_account),
            title: Text(
              'Admin Login',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 600),
                    child: AdminFirst()),
              ),
              // Navigator.pushReplacement(
              //   context,
              //   PageTransition(
              //     type: PageTransitionType.rightToLeftWithFade,
              //     duration: Duration(milliseconds: 600),
              //     // child: AdminFirst()
              //   ),
              // ),
            },
          ),
          // Expanded(
          //   child:

          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            child: Divider(
              color: Color(0xFF8a8e9a),
              height: 10,
            ),
          ),
          // ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text(
              'Call Helpline',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            // onTap: () => {launch("tel: 1075")},
          ),
          // Expanded(
          //   child:
          Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Color(0xFF8a8e9a),
                height: 10,
              )),
          // ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text(
              'AboutUs',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 600),
                      child: MyAboutus())),
              // Navigator.pushReplacement(
              //   context,
              //   PageTransition(
              //     type: PageTransitionType.rightToLeftWithFade,
              //     duration: Duration(milliseconds: 600),
              //     //child: Profile()
              //   ),
              // ),
            },
          ),
          // Expanded(
          //   child:

          // ),

          // ListTile(
          //   leading: Icon(Icons.account_box),
          //   title: Text(
          //     'Change Language',
          //     style: TextStyle(
          //       fontSize: 16,
          //     ),
          //   ),
          //   onTap: () =>
          //   {
          //     debugPrint('Changing Lang'),
          //     EasyLocalization
          //         .of(context)
          //         .locale = Locale('hi', 'IN')
          //   },
          // ),
          // Expanded(
          //   child:
          Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Color(0xFF8a8e9a),
                height: 10,
              )),
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () async {
              // try {
              //   Auth auth = Provider.of(context).auth;
              //   await auth.signOut();
              // } catch (e) {
              //   print(e);
              // }

              Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: Duration(milliseconds: 600),
                  child: Login1(),
                ),
              );
            },
          ),
//          Divider(
//            height: 30,
//            thickness: 1,
//            color: Color(0xFF8a8e9a),
//            indent: 1,
//            endIndent: 1,
//          ),
//           Expanded(
//             child:
          Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Color(0xFF8a8e9a),
                height: 10,
              )),
          // ),
          ListTile(
            title: Text(
              'Privacy Policy',
              style: TextStyle(
                color: Color(0xFF3b7dfb),
                fontSize: 16,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: Duration(milliseconds: 600),
                  child: Agra1()
                ),
              )
            },
          ),
//          Expanded(
//            child: new Container(
//                margin: const EdgeInsets.only(left: 0, right: 0.0),
//                child: Divider(
//                  color: Color(0xFF8a8e9a),
//                                    height: 10,

//                )),
//          ),
          ListTile(
            title: Text(
              'Terms & Conditions',
              style: TextStyle(
                color: Color(0xFF3b7dfb),
                fontSize: 16,
              ),
            ),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: Duration(milliseconds: 600),
                  child: Terms1()
                ),
              )
            },
          ),
        ],
      ),
    );
  }
}
