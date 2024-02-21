import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';

import '../page_transition.dart';
import 'third.dart';

class SecondQuestion extends StatefulWidget {
  final String age;
  final String temp;
  final String startTime;
  final String location;

  @override
  State<StatefulWidget> createState() {
    return _SecondQuestion();
  }

  SecondQuestion({this.age, this.startTime, this.location, this.temp});
}

class ActorFilterEntry {
  const ActorFilterEntry(this.name);

  final String name;
}

class _SecondQuestion extends State<SecondQuestion> {
  bool isVisibleForNoneBtn = true;
  bool isVisibleForNextBtn = false;

  //Filters
  final List<ActorFilterEntry> _cast = <ActorFilterEntry>[
    const ActorFilterEntry('Fever'),
    const ActorFilterEntry('Cough'),
    const ActorFilterEntry('Difficulty in Breathing'),
    const ActorFilterEntry('Sore throat'),
    const ActorFilterEntry('Loss of senses of smell and taste'),
  ];
  List<String> _filters = <String>[];

  Iterable<Widget> get actorWidgets sync* {
    for (final ActorFilterEntry actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilterChip(
          backgroundColor: Colors.white,
          selectedColor: Colors.grey[300],
          elevation: 3,
          label: Text(
            actor.name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          selected: _filters.contains(actor.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.name);
                print("'Look for: ${_filters.join(', ')}'");
                isVisibleForNextBtn = true;
                isVisibleForNoneBtn = false;
              } else {
                _filters.removeWhere((String name) {
                  print("'Look for: ${_filters.join(', ')}'");
                  isVisibleForNextBtn = false;
                  isVisibleForNoneBtn = true;
                  return name == actor.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.age);

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
                      "Are you experiencing any of the following symptoms?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Wrap(
                        children: actorWidgets.toList(),
                      ),
                      Visibility(
                        visible: isVisibleForNoneBtn,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: ChoiceChip(
                            backgroundColor: Colors.white,
                            elevation: 3,
                            label: Text(
                              "None of the above",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            selected: false,
                            onSelected: (selected) {
                              debugPrint("Location on second Screen " +
                                  widget.location);
                              navigateToScreen();
                            },
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isVisibleForNextBtn,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: RaisedButton(
                            elevation: 3,
                            color: Colors.white,
                            onPressed: () {
                              debugPrint("Location on second Screen " +
                                  widget.location);
                              navigateToScreen();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.blue[900]),
                            ),
                          ),
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

  navigateToScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ThirdQuestion(
                age: widget.age,
                temp: widget.temp,
                startTime: widget.startTime,
                location: widget.location,
                option1: _filters)));
  }
}
