import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import '../../../../page_transition.dart';
import '../../../admindash.dart';
import 'widgets/services.dart';
import 'widgets/subjectdatabox.dart';
// import '../OutputScreen/timetableoutputscreen.dart';
import '../InputScreen/widgets/practicaldatabox.dart';
import 'wipscreen.dart';

class TimeTableInput extends StatefulWidget {
  @override
  _TimeTableInputState createState() => _TimeTableInputState();
}

class _TimeTableInputState extends State<TimeTableInput> {
  bool _isMonSelected = false;
  bool _isTueSelected = false;
  bool _isWedSelected = false;
  bool _isThuSelected = false;
  bool _isFriSelected = false;
  bool _isSatSelected = false;
  bool _isSunSelected = false;
  List subjectBox = [];
  List<Subject> subjects = [];
  TextEditingController hr = TextEditingController();

  void sendSubjectData() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkInProgress(),
      ),
    );
  }

  void validateSend() {
    // ignore: unnecessary_statements
    int hours;
    var totalHours = 0;
    try {
      for (SubjectDataBox sub in subjectBox) {
        hours = int.parse(sub.hours.text);
        totalHours = totalHours + hours;
      }
      bool hasError = false;
      print(totalHours);
      if (getDays().isEmpty) {
        hasError = true;
        createAlertDialog(context, 'Please Select Days');
      } else if (int.parse(hr.text) <= 0) {
        hasError = true;
        createAlertDialog(context, 'Hours should not be 0 or less');
      } else if (totalHours > (int.parse(hr.text) * getDays().length)) {
        hasError = true;
        createAlertDialog(context,
            'Invalid Teaching Hours (Should be less or equal to total hours)');
      } else {
        sendSubjectData();
      }
    } catch (Exception) {
      createAlertDialog(context, 'Please check your input.');
    }
  }

  void getSubjectInfo() {
    String subject;
    List<String> teacher, classroom;
    int hours;
    for (SubjectDataBox sub in subjectBox) {
      subject = sub.subject.text;
      teacher = sub.teacher.text.split(',');
      classroom = sub.classroom.text.split(',');
      hours = int.parse(sub.hours.text);
      subjects.add(
        Subject(
          subjectName: subject,
          teachers: teacher,
          classrooms: classroom,
          hours: hours,
        ),
      );
      print(subject);
      print(teacher);
      print(classroom);
      print(hours);
    }
  }

  void addSubject() {
    subjectBox.add(SubjectDataBox());
    setState(() {});
  }

  void addPractical() {
    subjectBox.add(PracticalDataBox());
    setState(() {});
  }

  List<String> getDays() {
    List<String> ls = [];
    if (_isMonSelected) {
      ls.add('Mon');
    }
    if (_isTueSelected) {
      ls.add('Tue');
    }
    if (_isWedSelected) {
      ls.add('Wed');
    }
    if (_isThuSelected) {
      ls.add('Thu');
    }
    if (_isFriSelected) {
      ls.add('Fri');
    }
    if (_isSatSelected) {
      ls.add('Sat');
    }
    if (_isSunSelected) {
      ls.add('Sun');
    }

    return ls;
  }

  createAlertDialog(BuildContext context, String error) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Input Error'),
            content: Text(error),
            actions: <Widget>[
              FlatButton(
                color: Color(0xff407BFC),
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void selectType(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Select Subject Type"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            addSubject();
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text("Theory"),
        ),
        FlatButton(
          onPressed: () {
            addPractical();
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text("Practical"),
        )
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 600),
                child: Admin_dash()),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Class Scheduler",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.25,
                      //color: Colors.limeAccent,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("images/admin/chart.png"),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 45,
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.date_range,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Select Working Days',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: CheckboxListTile(
                                  value: _isMonSelected,
                                  title: Text(
                                    'Monday',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  activeColor: Color(0xff407BFC),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (val) {
                                    setState(() {
                                      _isMonSelected = val;
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                child: CheckboxListTile(
                                  value: _isTueSelected,
                                  title: Text(
                                    'Tuesday',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  activeColor: Color(0xff407BFC),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (val) {
                                    setState(() {
                                      _isTueSelected = val;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: CheckboxListTile(
                                  value: _isWedSelected,
                                  title: Text(
                                    'Wednesday',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  activeColor: Color(0xff407BFC),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (val) {
                                    setState(() {
                                      _isWedSelected = val;
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                child: CheckboxListTile(
                                  value: _isThuSelected,
                                  title: Text(
                                    'Thursday',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  activeColor: Color(0xff407BFC),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (val) {
                                    setState(() {
                                      _isThuSelected = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: CheckboxListTile(
                                  value: _isFriSelected,
                                  title: Text(
                                    'Friday',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  activeColor: Color(0xff407BFC),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (val) {
                                    setState(() {
                                      _isFriSelected = val;
                                    });
                                  },
                                ),
                              ),
                              Flexible(
                                child: CheckboxListTile(
                                  value: _isSatSelected,
                                  title: Text(
                                    'Saturday',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  activeColor: Color(0xff407BFC),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (val) {
                                    setState(() {
                                      _isSatSelected = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          CheckboxListTile(
                            value: _isSunSelected,
                            title: Text(
                              'Sunday',
                              style: TextStyle(fontSize: 17),
                            ),
                            activeColor: Color(0xff407BFC),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (val) {
                              setState(() {
                                _isSunSelected = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: hr,
                              // inputFormatters: <TextInputFormatter>[
                              //   WhitelistingTextInputFormatter.digitsOnly
                              // ],
                              decoration: InputDecoration(
                                hintText: 'Enter Time Slots per day',
                                icon: Icon(Icons.timer),
                                labelStyle: TextStyle(
                                  color: Color(0xff407BFC),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: hr,
                              decoration: InputDecoration(
                                hintText: 'Classroom List (Comma seperated)',
                                icon: Icon(Icons.school),
                                labelStyle: TextStyle(
                                  color: Color(0xff407BFC),
                                ),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: hr,
                              decoration: InputDecoration(
                                hintText: 'Enter Total no. of Sections',
                                icon: Icon(Icons.aspect_ratio),
                                labelStyle: TextStyle(
                                  color: Color(0xff407BFC),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        )),
                    for (var sub in subjectBox) sub,
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: RaisedButton.icon(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 25, right: 25),
                      elevation: 2,
                      //onPressed: addSubject,
                      onPressed: () {
                        selectType(context);
                      },
                      label: Text(
                        'Add Subject',
                        style: TextStyle(fontSize: 16),
                      ),
                      color: Colors.black,
                      textColor: Colors.white,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: RaisedButton.icon(
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 25, right: 25),
                      elevation: 2,
                      onPressed: validateSend,
                      label: Text(
                        'Get Schedule',
                        style: TextStyle(fontSize: 16),
                      ),
                      color: Color(0xFF407BFC),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
