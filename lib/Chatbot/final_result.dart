import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';

import '../page_transition.dart';

class Result extends StatefulWidget {
  final String age;
  final String temp;
  final String startTime;
  final String result;
  final List<String> option1;
  final List<String> option2;
  final List<String> option3;
  final List<String> option4;
  final String ans;
  final String location;

  //final String res;

  Result({
    this.age,
    this.temp,
    this.startTime,
    this.location,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.ans,
    this.result,
  });

  @override
  State<StatefulWidget> createState() {
    return _Result();
  }
}

class _Result extends State<Result> {
  final databaseReference = Firestore.instance;

  var date;
  String res = "";

  int count = 0;

  @override
  Widget build(BuildContext context) {
    void _toDash() {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    return WillPopScope(
      onWillPop: () {
        _toDash();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            // onPressed: () => Navigator.push(
            //   context,
            //   PageTransition(
            //       type: PageTransitionType.rightToLeft,
            //       duration: Duration(milliseconds: 600),
            //       child: Dash()),
            // ),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "Assessment",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              SizedBox(height: 10),

              //Normal text
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF3b7dfb),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                margin: EdgeInsets.all(5.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 14, right: 0, top: 10, bottom: 10),
                  child: Text(
                    '\nWe hope you have answered all questions honestly.\n\n Accurate answers will help us to help you better. \n\n Your risk factor solely depends upon the questions answered by you.\n',
                    maxLines: null,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
//              Container(
//                child: Padding(
//                  padding: const EdgeInsets.only(top: 25),
//                  child: RaisedButton(
//                    elevation: 3,
//                    color: Colors.white,
//                    onPressed: () {
//                      count++;
//                      //debugPrint("End result " + widget.res);
//                      date = formatTimeOfDay(TimeOfDay.now());
//                      storeData();
//                      extractResult();
//                      navigateToScreen();
//                    },
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10)),
//                    child: Text(
//                      "End Assessment",
//                      style: TextStyle(color: Colors.blue[900]),
//                    ),
//                  ),
//                ),
//              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: RaisedButton(
                    elevation: 3,
                    color: Colors.white,
                    onPressed: () {
                      count++;
                      //debugPrint("End result " + widget.res);
                      date = formatTimeOfDay(TimeOfDay.now());
                      storeData();
                      extractResult();
                      showDialog(
                        context: context,
                        builder: (_) =>
                            FunkyOverlay(result: widget.result, res: res),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "I agree",
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String extractResult() {
    print("Inside extractResult");
    if (widget.result ==
        "\nWe recommend that you stay at home to avoid any chances of exposure to the Novel Coronavirus."
            "\n\nRetake the Self-Assessment Test if you develop more symptoms or come in contact with a COVID-19 confirmed patient.") {
      setState(() {
        res = "Low Risk";
      });

      print(res);
    } else if (widget.result ==
        "\nWe recommend that you stay at home to avoid any chances of greater exposure to the Novel Coronavirus.\n \nIf your symptoms increase, we would recommend you to please visit the nearest covid centre and get yourself tested.") {
      setState(() {
        res = "Medium Risk";
      });

      print(res);
    } else if (widget.result ==
        "\nWe highly recommend that you visit the nearest covid centre and get yourself tested and also self quarantine yourself at the earliest.") {
      setState(() {
        res = "High Risk";
      });
      print(res);
    } else {
      setState(() {
        res = "Low Risk";
      });
      print(res);
    }
    return res;
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    print(format.format(dt));
    return format.format(dt);
  }

  void storeData() async {
    String res = extractResult();
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    final DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference(); //.
    print('Success');

    //RealTime DB
    databaseReference.child("selfAssessmentUser").child(firebaseUser.uid).set({
      "age": widget.age,
      "temperature": widget.temp,
      "startTime": widget.startTime,
      "location": widget.location,
      "symptoms1": widget.option1.toString(),
      "symptoms2": widget.option2.toString(),
      "medical_condition": widget.option3.toString(),
      "travel_history": widget.option4.toString(),
      "internation_travel_history": widget.ans,
      "end_time": date,
      "result": res
    });
//    await databaseReference
//        .collection("users")
//        .document(count.toString())
//        .setData({
//      "age": widget.age,
//      "startTime": widget.startTime,
//      "location": widget.location,
//      "symptoms1": widget.option1.toString(),
//      "symptoms2": widget.option2.toString(),
//      "medical_condition": widget.option3.toString(),
//      "travel_history": widget.option4.toString(),
//      "internation_travel_history": widget.ans,
//      "end_time": date,
//      "result": widget.result
//    });
  }

  Future<bool> _onBackPressed() async {
    storeData();
    debugPrint("Inside FinalResult _onBackPressed");
    return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Dash(
                      selfAssesResult: res,
                    ))) ??
        false;
  }

  void navigateToScreen() {
    debugPrint("Inside FinalResult NavigateToScreen");

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/dashboard', (Route<dynamic> route) => false);
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => Dash(
    //               selfAssesResult: res,
    //             )));
  }
}

class FunkyOverlay extends StatefulWidget {
  final String result;
  final String res;

  FunkyOverlay({this.result, this.res});

  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Center(
            child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
              scale: scaleAnimation,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.res,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: color_res(widget.res)),
                        ),
                        Text(
                          widget.result,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        RaisedButton(
                          elevation: 3,
                          color: Colors.white,
                          onPressed: () {
                            navigateToScreen();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "End Assessment",
                            style: TextStyle(
                              color: Color(0xFF3b7dfb),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//
                ),
              )),
        )));
  }

  void navigateToScreen() {
    debugPrint("Inside Funky NavigateToScreen");

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Dash()),
        (Route<dynamic> route) => false);

    // Navigator.of(context).pushNamedAndRemoveUntil('/dashboard', (Route<dynamic> route) => false);
    //
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Dash()));
  }

  Future<bool> _onBackPressed() {
    debugPrint("Inside Funkky _onBackPressed");
    // return Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => Dash())) ??
    //     false;

    return Navigator.pushNamedAndRemoveUntil(
        context, "/dashboard", (Route<dynamic> route) => false);
  }

  Color color_res(String res) {
    Color col;
    if (res == 'Low Risk') {
      col = Colors.green;
    } else if (res == 'Medium Risk') {
      col = Colors.orange;
    } else if (res == 'High Risk') {
      col = Colors.red;
    }
    return col;
  }
}
