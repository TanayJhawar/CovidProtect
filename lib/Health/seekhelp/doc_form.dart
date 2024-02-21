import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sakecblue/Health/seekhelp/doctor.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class Model {
  String name;
  String email;
  String phone;
  String weight;
  String degree;
  String organisation;

  Model({
    this.name,
    this.email,
    this.phone,
    this.degree,
    this.organisation,
  });
}

class FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    void _toDash() {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    return WillPopScope(
        onWillPop: () {
          _toDash();
        },
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                MyTextFormField(
                  hintText: 'Name',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.name = value;
                  },
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
                MyTextFormField(
                  hintText: 'Degree',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter your degree';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.degree = value;
                  },
                ),
                MyTextFormField(
                  hintText: 'Organisation',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Enter your organisation';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    model.organisation = value;
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
                        child: RaisedButton(
                          color: Colors.blueAccent,
                          onPressed: () async {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            //uploadFile(_name);
                            await db.collection("doctor").add(
                              {
                                "name": model.name,
                                "email": model.email,
                                "number": model.phone,
                                "organisation": model.organisation,
                                "degree": model.degree,
                              },
                            );
                            showAlertDialog(context);
                            /*print(model.name);
                      print(model.email);
                      print(model.phone);
                      print(model.organisation);
                      print(model.degree);*/
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
                )
              ],
            ),
          ),
        ));
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage2()),
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Success"),
    content: Text(
        "Thank you for using SAKECBlue. Your information has been stored in our database and will only be provided to the patient after it books an appointment with you."),
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
