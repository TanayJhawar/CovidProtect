import 'package:app_settings/app_settings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/TermsAndCondition/agreement.dart';

class Splayimage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Splayimage();
  }
}

class _Splayimage extends State<Splayimage> {
  bool isconnectivity = false;

  @override
  void initState() {
    isInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Material(
          child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Live Stats\nSelf Assessment\nMental Health\nContact Tracing",
                  style: TextStyle(
                    color: Color(0xFF3b7dfb),
                    fontSize: 35.0,
                    fontFamily: 'Bebas',
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(
                image: AssetImage('images/TillDash/splay.png'),
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 3,
        label: Text("Get Started"),
        icon: Icon(Icons.arrow_forward),
        onPressed: () {
//          isInternet();
          debugPrint(isconnectivity.toString());
          if (isconnectivity) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Agra()));
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Column(
                      children: <Widget>[
                        Image.asset(
                          'images/no_wifi.png',
                          height: 70,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "No Internet Connection Found",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    content: new Text(
                        "Make sure your phone is connected to the WiFi or switch to mobile data"),
                    actions: <Widget>[
                      FlatButton(
                        child: new Text(
                          "Try Again",
                          style: TextStyle(
                            color: Color(0xFF3b7dfb),
                          ),
                        ),
                        onPressed: () {
                          isInternet();
                          if (isconnectivity) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Agra()));
                          }
                        },
                      ),
                      FlatButton(
                        child: new Text(
                          "Settings",
                          style: TextStyle(
                            color: Color(0xFF3b7dfb),
                          ),
                        ),
                        onPressed: () {
                          AppSettings.openWIFISettings();
                        },
                      ),
                    ],
                  );
                });
          }
        },
        backgroundColor: Color(0xFF3b7dfb),
        // child: Row(
        //   children: <Widget>[

        //     Text("Get Started "),

        //     Icon(Icons.arrow_forward),

        //   ]
        // )
      ),
    );
  }

  Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        setState(() {
          isconnectivity = true;
        });
        debugPrint('mobile true ${isconnectivity}');
        // Mobile data detected & internet connection confirmed.
        return isconnectivity;
      } else {
        debugPrint('mobile false');

        isconnectivity = false;

        // Mobile data detected but no internet connection found.
        return isconnectivity;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a WIFI network, make sure there is actually a net connection.
      if (await DataConnectionChecker().hasConnection) {
        isconnectivity = true;
        debugPrint('wifi true');

        // Wifi detected & internet connection confirmed.
        return isconnectivity;
      } else {
        debugPrint('wifi false');

        isconnectivity = false;

        // Wifi detected but no internet connection found.
        return isconnectivity;
      }
    } else {
      debugPrint(' false');

      isconnectivity = false;

      // Neither mobile data or WIFI detected, not internet connection found.
      return isconnectivity;
    }
  }
}
