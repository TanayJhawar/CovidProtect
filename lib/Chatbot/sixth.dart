import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';

import '../page_transition.dart';
import 'final_result.dart';

class SixthQuestion extends StatefulWidget {
  final List<String> option1;
  final List<String> option2;
  final List<String> option3;
  final List<String> option4;
  final String age;
  final String temp;
  final String startTime;
  final String location;

  SixthQuestion(
      {this.age,
      this.temp,
      this.startTime,
      this.location,
      this.option1,
      this.option2,
      this.option3,
      this.option4});

  @override
  State<StatefulWidget> createState() => _SixthQuestion();
}

class _SixthQuestion extends State<SixthQuestion> {
  String ans = "";
  String res = "";
  showChosenChip(String choice) {
    print("User has selected $choice");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.age);
    debugPrint(widget.temp);
    debugPrint(widget.option1.toString());
    debugPrint(widget.option2.toString());
    debugPrint(widget.option3.toString());
    debugPrint(widget.option4.toString());

    void _toDash() {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    return WillPopScope(
        onWillPop: () {
          _toDash();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
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
                      )),
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.only(right: 30.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 0, top: 10, bottom: 10),
                    child: Text(
                      "Have you traveled anywhere internationally in the last 28-45 days?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Wrap(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: ChoiceChip(
                          backgroundColor: Colors.white,
                          elevation: 3,
                          label: Text(
                            "Yes",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          selected: false,
                          onSelected: (selected) {
                            ans = "Yes";
                            debugPrint("The result is " + calResult());
                            navigateToResult();
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: ChoiceChip(
                          backgroundColor: Colors.white,
                          elevation: 3,
                          label: Text(
                            "No",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          selected: false,
                          onSelected: (selected) {
                            ans = "No";
                            //showChosenChip(ans);
                            debugPrint("The result is " + calResult());
                            navigateToResult();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String calResult() {
    String result = "";
    if ((widget.option1.isNotEmpty) &&
        (widget.option2.isEmpty) &&
        (widget.option3.isEmpty) &&
        (widget.option4.isNotEmpty)) {
      res = "Low risk";
      result =
          "\nWe recommend that you stay at home to avoid any chances of exposure to the Novel Coronavirus."
          "\n\nRetake the Self-Assessment Test if you develop more symptoms or come in contact with a COVID-19 confirmed patient.";
    } else if (((widget.option1.isNotEmpty) &&
            (widget.option2.isNotEmpty) &&
            (widget.option3.isEmpty) &&
            (widget.option4.isNotEmpty) &&
            (widget.temp == 'Normal (96 Degree to 98.6 Degree)')) ||
        ((widget.option1.isNotEmpty) &&
            (widget.option2.isNotEmpty) &&
            (widget.option3.isEmpty) &&
            (widget.option4.isNotEmpty) &&
            (widget.temp == 'Fever (98.7 Degree to 102 Degree)'))) {
      res = "Medium risk";
      result =
          "\nWe recommend that you stay at home to avoid any chances of greater exposure to the Novel Coronavirus.\n \nIf your symptoms increase, we would recommend you to please visit the nearest covid centre and get yourself tested.";
    } else if (((widget.option1.isNotEmpty) &&
            (widget.option2.isNotEmpty) &&
            (widget.option3.isNotEmpty) &&
            (widget.option4.isNotEmpty) &&
            (widget.temp == 'Fever (98.7 Degree to 102 Degree)')) ||
        ((widget.option1.isNotEmpty) &&
            (widget.option2.isNotEmpty) &&
            (widget.option3.isNotEmpty) &&
            (widget.option4.isNotEmpty) &&
            (widget.temp == 'High Fever (Above 102 Degree)'))) {
      res = "High Risk";
      result =
          "\nWe highly recommend that you visit the nearest covid centre and get yourself tested and also self quarantine yourself at the earliest.";
    } else {
      res = "Low Risk";
      result =
          "\nWe recommend that you stay a home to avoid any chances of exposure to the Novel Coronavirus."
          "\n \nRetake the Self-Assessment Test if you develop more symptoms or come in contact with a COVID-19 confirmed patient.";
    }

    return result;
  }

  void navigateToResult() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Result(
                age: widget.age,
                temp: widget.temp,
                startTime: widget.startTime,
                location: widget.location,
                option1: widget.option1,
                option2: widget.option2,
                option3: widget.option3,
                option4: widget.option4,
                ans: ans,
                result: calResult())));
  }
}
