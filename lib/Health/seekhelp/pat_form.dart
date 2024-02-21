import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Tilldash/bottom.dart';
import 'package:validators/validators.dart' as validator;
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:sakecblue/Health/seekhelp/doctor.dart';

import '../../page_transition.dart';

class FillForm extends StatefulWidget {
  final String docmail;
  const FillForm(this.docmail);
  @override
  _FillFormState createState() => _FillFormState();
}

class Model {
  String firstName;
  String lastName;
  String email;
  String phone;
  String gender;
  String age;
  String weight;
  String illness;
  String city;

  Model({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.gender,
    this.age,
    this.illness,
    this.city,
  });
}

class _FillFormState extends State<FillForm> {
  String email;
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
  bool isHTML = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: 'Name : ' +
          model.firstName +
          ' ' +
          model.lastName +
          '\nEmail Id : ' +
          model.email +
          '\nPhone Number : ' +
          model.phone +
          '\nAge : ' +
          model.age +
          '\nGender : ' +
          model.gender +
          '\n Problem Faced : ' +
          model.illness,
      subject: 'Request Appointment',
      recipients: [widget.docmail],
      // cc: ['cc@example.com'],
      isHTML: isHTML,
    );
    String platformResponse;
    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }
    if (!mounted) return;
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 600),
                child: Dash()),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            "Patient Registration",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormField(
                      hintText: 'First Name',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your first name';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.firstName = value;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormField(
                      hintText: 'Last Name',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your last name';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.lastName = value;
                      },
                    ),
                  )
                ],
              ),
            ),
            MyTextFormField(
              hintText: 'Email',
              isEmail: true,
              validator: (String value) {
                if (!validator.isEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (String value) {
                model.email = value;
                email = value;
              },
            ),
            MyTextFormField(
              hintText: 'Phone Number',
              isphone: true,
              validator: (String value) {
                if ((value.length != 10)) {
                  return 'Mobile Number must be of 10 digit';
                }
                return null;
              },
              onSaved: (String value) {
                model.phone = value;
              },
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormField(
                      hintText: 'Age',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your Age';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.age = value;
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormField(
                      hintText: 'Gender',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your Gender';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.gender = value;
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: MyTextFormField(
                hintText: 'Illness',
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter your Illness';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.illness = value;
                },
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormField(
                      hintText: 'City ',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your City Name';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.city = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: halfMediaWidth,
              child: RaisedButton(
                color: Color(0xFF3b7dfb),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

                    showAlertDialog(context);
                    send();
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isEmail;
  final bool isphone;
  final firstName = TextEditingController();

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isEmail = false,
    this.isphone = false,
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

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('dialog');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dash()),
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Success"),
    content: Text(
        "Thank you for using SAKECBlue. We shall process your request and contact via mail once Service is availabe"),
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
