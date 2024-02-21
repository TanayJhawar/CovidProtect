import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Health/plasmadonation/plasmamain.dart';
import 'package:sakecblue/Tilldash/bottom.dart';
import 'package:validators/validators.dart' as validator;
import 'package:flutter_email_sender/flutter_email_sender.dart';

import '../../page_transition.dart';

class FillForm extends StatefulWidget {
  @override
  _FillFormState createState() => _FillFormState();
}

class Model {
  String firstName;
  String lastName;
  String email;
  String phone;
  String gender;
  String blood;
  String age;
  String weight;
  String address;
  String city;
  String country;

  Model(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.gender,
      this.blood,
      this.age,
      this.weight,
      this.address,
      this.city,
      this.country});
}

class _FillFormState extends State<FillForm> {
  String email;
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
  bool isHTML = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    var mail = model.email;
    var firstname = model.firstName;
    var lastname = model.lastName;
    var phone = model.phone;
    var blood = model.blood;
    var age = model.age;
    var weight = model.weight;
    var city = model.city;
    var country = model.country;
    var address = model.address;
    final Email email = Email(
      body: 'I, $firstname $lastname, am willing to do the plasma donation.\n'
          'My details are,\n'
          'Full Name: $firstname $lastname\n'
          'Email Id: $mail\n'
          'Phone Number: $phone\n'
          'Blood Group: $blood \n'
          'Age: $age \n'
          'Weight: $weight\n'
          'Location: $address, $city, $country.',
      subject: 'Plasma Donation',
      recipients: ['cblueeyesoft@gmail.com'],
      // cc: ['cc@example.com'],
      isHTML: isHTML,
    );
    String platformResponse;
    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
      showAlertDialog(context);
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
            "Plasma Donation Form",
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
                if (!validator.isEmail(value.trim())) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (String value) {
                model.email = value.trim();
                email = value.trim();
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
                model.phone = value.trim();
              },
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.only(right: 30.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 0, top: 10, bottom: 10),
                child: DropdownButton(
                    isExpanded: true,
                    hint: Text('Select Gender'),
                    value: model.gender,
                    items: [
                      DropdownMenuItem(
                        child: Text("Male"),
                        value: 'Male',
                      ),
                      DropdownMenuItem(
                        child: Text("Female"),
                        value: 'Female',
                      ),
                      DropdownMenuItem(
                        child: Text("Other"),
                        value: 'Other',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        model.gender = value;
                      });
                    }),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.only(right: 30.0),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 0, top: 10, bottom: 10),
                child: DropdownButton(
                    isExpanded: true,
                    hint: Text('Select Blood Group'),
                    value: model.blood,
                    items: [
                      DropdownMenuItem(
                        child: Text("A+"),
                        value: 'A+',
                      ),
                      DropdownMenuItem(
                        child: Text("A-"),
                        value: 'A-',
                      ),
                      DropdownMenuItem(
                        child: Text("B+"),
                        value: 'B+',
                      ),
                      DropdownMenuItem(
                        child: Text("B-"),
                        value: 'B-',
                      ),
                      DropdownMenuItem(
                        child: Text("AB+"),
                        value: 'AB+',
                      ),
                      DropdownMenuItem(
                        child: Text("AB-"),
                        value: 'AB-',
                      ),
                      DropdownMenuItem(
                        child: Text("O+"),
                        value: 'O+',
                      ),
                      DropdownMenuItem(
                        child: Text("O-"),
                        value: 'O-',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        model.blood = value;
                      });
                    }),
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
                      hintText: 'Weight',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your weight';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.weight = value;
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: MyTextFormField(
                hintText: 'Address',
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter your Address';
                  }
                  return null;
                },
                onSaved: (String value) {
                  model.address = value;
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
                  Container(
                    alignment: Alignment.topCenter,
                    width: halfMediaWidth,
                    child: MyTextFormField(
                      hintText: 'Country ',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter your Country Name';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        model.country = value;
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
                color: Colors.blueAccent,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();

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
        MaterialPageRoute(builder: (context) => Plasma()),
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Success"),
    content: Text(
        "Thank you for your willingness to donate convalescent plasma for people seriously ill with COVID-19. We will revert you as soon as possible."),
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
