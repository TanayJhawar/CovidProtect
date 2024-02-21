import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';

import '../page_transition.dart';
import 'sixth.dart';

class EightQuestion extends StatefulWidget {
  final List<String> option1;
  final List<String> option2;
  final List<String> option3;
  final List<String> option4;
  final String age;
  final String temp;
  final String startTime;
  final String location;

  EightQuestion(
      {this.age,
      this.temp,
      this.startTime,
      this.location,
      this.option1,
      this.option2,
      this.option3,
      this.option4});

  @override
  State<StatefulWidget> createState() => _EightQuestion();
}

class _EightQuestion extends State<EightQuestion> {
  String progress = "";
  showChosenChip(String choice) {
    print("User has selected $choice");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.age);
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
                      color: Hexcolor('#3b7dfb'),
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
                      "How have your symptoms progressed over the last 48 hours?",
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
                            "Improved",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          selected: false,
                          onSelected: (selected) {
                            progress = "Improved";
                            showChosenChip(progress);
                            navigateToScreen();
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
                            "Same, No change",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          selected: false,
                          onSelected: (selected) {
                            progress = "Same, No change";
                            showChosenChip(progress);
                            navigateToScreen();
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
                            "Bad",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          selected: false,
                          onSelected: (selected) {
                            progress = "Bad";
                            showChosenChip(progress);
                            navigateToScreen();
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
                            "Bad Considerably",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          selected: false,
                          onSelected: (selected) {
                            progress = "Bad Considerably";
                            showChosenChip(progress);
                            navigateToScreen();
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

  void navigateToScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SixthQuestion(
                  age: widget.age,
                  temp: widget.temp,
                  startTime: widget.startTime,
                  location: widget.location,
                  option1: widget.option1,
                  option2: widget.option2,
                  option3: widget.option3,
                  option4: widget.option4,
                )));
  }
}
