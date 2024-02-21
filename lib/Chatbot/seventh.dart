import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import '../page_transition.dart';
import 'second.dart';

class SeventhQuestion extends StatefulWidget {
  final String startTime;
  final String location;
  final String age;
  final String temp;

  SeventhQuestion({this.startTime, this.location, this.age, this.temp});

  @override
  State<StatefulWidget> createState() {
    return _SeventhQuestion();
  }
}

class _SeventhQuestion extends State<SeventhQuestion> {
  String temp = "";

  showChosenChip(String choice) {
    print("Location at Seventh Screen " + widget.location);
    print("User has selected $choice");
  }

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
                        "What is your current body temperature in degrees Fahrenheit?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  //Options
                  Container(
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: ChoiceChip(
                            backgroundColor: Colors.white,
                            elevation: 3,
                            label: Text(
                              "Normal (96 Degree to 98.6 Degree)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            selected: false,
                            onSelected: (selected) {
                              setState(() {
                                temp = "Normal (96 Degree to 98.6 Degree)";
                                showChosenChip(temp);
                                navigateToScreen();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: ChoiceChip(
                            backgroundColor: Colors.white,
                            elevation: 3,
                            label: Text(
                              "Fever (98.7 Degree to 102 Degree)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            selected: false,
                            onSelected: (selected) {
                              setState(() {
                                temp = "Fever (98.7 Degree to 102 Degree)";
                                showChosenChip(temp);
                                navigateToScreen();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: ChoiceChip(
                            backgroundColor: Colors.white,
                            elevation: 3,
                            label: Text(
                              "High Fever (Above 102 Degree)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.w900,
                            ),
                            selected: false,
                            onSelected: (selected) {
                              setState(() {
                                temp = "High Fever (Above 102 Degree)";
                                showChosenChip(temp);
                                navigateToScreen();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
    //);
  }

  void navigateToScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SecondQuestion(
                age: widget.age,
                temp: temp,
                startTime: widget.startTime,
                location: widget.location)));
  }
}
