import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Health/plasmadonation/plasmaform.dart';
import '../../Dashboard/dashboard.dart';
import '../../page_transition.dart';

class Plasma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _gotoDash() {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    return WillPopScope(
        onWillPop: () {
          _gotoDash();
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
                "Plasma Donation",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: TestForm(),
        ));
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  String date1;
  String date2;
  String q1;
  String q2;
  String q3;
  String q4;
  String q5;
  String q0;

  String _selectedDate = 'Tap to select date';
  String _selectedDate1 = 'Tap to select date';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
        date1 = _selectedDate;
        print(date1);
      });
  }

  Future<void> _selectDate1(BuildContext context) async {
    final DateTime d1 = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    );
    if (d1 != null)
      setState(() {
        _selectedDate1 = new DateFormat.yMMMMd("en_US").format(d1);
        date2 = _selectedDate1;
        print(date2);
      });
  }

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ListView(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, bottom: 8.0, top: 5.0),
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 0, top: 0, bottom: 12),
                child: Text(
                  "Your 5 minutes will save someones life, Please answer this short Q & A to know your eligibility.",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf3f3f3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              margin: EdgeInsets.all(7.0),
              padding: EdgeInsets.only(right: 30.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 0, top: 12, bottom: 12),
                child: Text(
                  "Did you test positive for COVID-19?",
                  style: TextStyle(
                    color: Colors.black,
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
                    padding: const EdgeInsets.only(top: 5, right: 8, left: 10),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q0 == "Yes",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q0 = selected ? "Yes" : 0;
                          print(q0);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q0 == "No",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q0 = selected ? "No" : 0;
                          print(q0);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5.0, bottom: 15.0),
              child: Text(
                "(If you did not test positive for COVID-19 or do not have a positive antibody test result please do not submit this form.)",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf3f3f3),
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
                    left: 15, right: 0, top: 12, bottom: 12),
                child: Text(
                  "Has it been at least 14 days since your last day of symptoms?",
                  style: TextStyle(
                    color: Colors.black,
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
                    padding: const EdgeInsets.only(
                        top: 5, right: 8, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q1 == "Yes",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q1 = selected ? "Yes" : 0;
                          print(q1);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, right: 10, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q1 == "No",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q1 = selected ? "No" : 0;
                          print(q1);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf3f3f3),
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
                    left: 15, right: 0, top: 10, bottom: 10),
                child: Text(
                  "Are you aged between 18 to 60 years old?",
                  style: TextStyle(
                    color: Colors.black,
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
                    padding: const EdgeInsets.only(
                        top: 5, right: 8, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q2 == "Yes",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q2 = selected ? "Yes" : 0;
                          print(q2);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, right: 10, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q2 == "No",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q2 = selected ? "No" : 0;
                          print(q2);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ), //
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf3f3f3),
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
                    left: 15, right: 0, top: 12, bottom: 12),
                child: Text(
                  "Do you weigh more than 7Stone 12Lbs (50kg)?",
                  style: TextStyle(
                    color: Colors.black,
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
                    padding: const EdgeInsets.only(
                        top: 5, right: 8, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q3 == "Yes",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q3 = selected ? "Yes" : 0;
                          print(q3);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, right: 10, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q3 == "No",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q3 = selected ? "No" : 0;
                          print(q3);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf3f3f3),
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
                    left: 15, right: 0, top: 12, bottom: 12),
                child: Text(
                  "Are you pregnant, or have you had a baby, miscarriage or a termination in the last 6 months?",
                  style: TextStyle(
                    color: Colors.black,
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
                    padding: const EdgeInsets.only(
                        top: 5, right: 8, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q4 == "Yes",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q4 = selected ? "Yes" : 0;
                          print(q4);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, right: 10, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q4 == "No",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q4 = selected ? "No" : 0;
                          print(q4);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf3f3f3),
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
                    left: 15, right: 0, top: 12, bottom: 12),
                child: Text(
                  "Have you got, or have you had, any cronic disease like heart, kidney?",
                  style: TextStyle(
                    color: Colors.black,
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
                    padding: const EdgeInsets.only(
                        top: 5, right: 8, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'Yes',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q5 == "Yes",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q5 = selected ? "Yes" : 0;
                          print(q5);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, right: 10, left: 10, bottom: 15.0),
                    child: ChoiceChip(
                      label: Container(
                        width: 50,
                        height: 20,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      elevation: 3,
                      selected: q5 == "No",
                      selectedColor: Color(0xFF033ca9),
                      onSelected: (bool selected) {
                        setState(() {
                          q5 = selected ? "No" : 0;
                          print(q5);
                        });
                      },
                      backgroundColor: Color(0xFF3b7dfb),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf3f3f3),
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
                    left: 15, right: 0, top: 10, bottom: 10),
                child: Text(
                  "What is your estimate date of last symptom?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(_selectedDate,
                          //   textAlign: TextAlign.center,

                          style: TextStyle(
                              fontSize: 15.0, color: Color(0xFF000000))),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                    IconButton(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 90.0),
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf3f3f3),
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
                    left: 15, right: 0, top: 10, bottom: 10),
                child: Text(
                  " What was your test date?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(_selectedDate1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15.0, color: Color(0xFF000000))),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                    IconButton(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(right: 90.0),
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                        _selectDate1(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 90.0, right: 60.0),
                child: RaisedButton(
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Color(0xFF3b7dfb),
                  onPressed: () {
                    if (q0 == 'Yes' &&
                        q1 == 'Yes' &&
                        q2 == 'Yes' &&
                        q3 == 'Yes' &&
                        q4 == 'No' &&
                        q5 == 'No') {
                      showAlertDialog1(context);
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

showAlertDialog1(BuildContext context) {
  // Create button
  Widget disagreeButton = FlatButton(
    child: Text("I Agree"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FillForm()),
      );
    },
  );
  Widget agreeButton = FlatButton(
    child: Text(
      "I Disagree",
      style: TextStyle(
        color: Colors.grey,
      ),
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Plasma()),
      );
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    insetPadding: EdgeInsets.all(6.0),
    title: Text("Privacy Policy"),
    content: Text(
        "-Your personal information is accessible only by employees who need to access your personal information to perform a specific job. "
        " -We never sell or share your information with any 3rd parties."
        "-To safeguard your personal information, we respect your privacy and want to protect your personal information and will not share, display or sell any of your personal information."
        " -We also take several steps to protect your personal information in our facilities."
        " -Access to your personal information is restricted."),
    actions: [
      agreeButton,
      disagreeButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('Dialog');
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => Plasma()),
//      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Sorry! You are not eligible for donation."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
