import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:sakecblue/Login/Login2/screens/login/login.dart';
import 'package:sakecblue/Login/login.dart';
import 'package:sakecblue/TermsAndCondition/terms.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Agra1 extends StatefulWidget {
  @override
  _AgraState createState() => _AgraState();
}

class _AgraState extends State<Agra1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SAKEBlue",
      home: Agra2(),
    );
  }
}

class Agra2 extends StatefulWidget {
  @override
  _Agra1State createState() => _Agra1State();
}

class _Agra1State extends State<Agra2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Baselayout(),
        ));
  }
}

class Baselayout extends StatefulWidget {
  @override
  _BaselayoutState createState() => _BaselayoutState();
}

class _BaselayoutState extends State<Baselayout> {
  Position position;
  String _currentAddress = "";
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 50.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Terms & Condition",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 35.0,
                  fontFamily: 'Bebas',
                ),
              ),
            ),
            Row(
              children: <Widget>[],
            ),
            C1(),
            C2(),
            Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.blueAccent,
                  child: Text(
                    'I Agree',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
//                    userLocation();

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login1()));
                  },
                )),
          ],
        ));
  }

  locatinoSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('latlong', position.toString());
    prefs.setString("located", _currentAddress);
  }

  //Fetching User's latitude and longitude
  Future<String> userLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    print("User location at Agreement ${position}");
    _getAddressFromLatLng();
    //convertLocationToString();
    return position.toString();
  }

  //Getting user's City
  _getAddressFromLatLng() async {
    print("User position ${position}");
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          position.latitude, position.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
      locatinoSharedPref();
      print("User address ${_currentAddress}");
    } catch (e) {
      print(e);
    }
  }
}

class C1 extends StatefulWidget {
  @override
  _C1State createState() => _C1State();
}

class _C1State extends State<C1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 5.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image(
                image: AssetImage('images/safety.png'),
                width: 70,
                height: 70,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'We understand the nature and sensitivity of this topic and have taken strong measures to ensure that your data is not compromised.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          )),
    );
  }
}

class C2 extends StatefulWidget {
  @override
  _C2State createState() => _C2State();
}

class _C2State extends State<C2> {
  String location = "";

  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Bluetooth',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              "Monitors your device's proximity to another mobile device.It is recommended that you keep it on at all times.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Location',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              "It is recommended that you set your location sharing to Always You can change this anytime later.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Data Sharing',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              "Your Data will be shared only with the Government of India.The App does not allow your name and number to be disclosed to the public at large at any time.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
            ),
            GestureDetector(
              child: RichText(
                text: TextSpan(
                  text:
                  'If you would like to contribute to a safer India please indicate your acceptance of the ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms of Service.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.blue[300],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
//              convertLocationToString();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Terms()));
              },
            )
          ],
        ));
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