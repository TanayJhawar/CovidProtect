import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sakecblue/Login/Login2//constants.dart';
import 'package:sakecblue/Login/Login2//screens/login/widgets/custom_clippers/index.dart';
import 'package:sakecblue/Login/Login2/screens/login/widgets/header.dart';

import '../../../validators.dart';
import 'login.dart';

class Forgot_Screen extends StatefulWidget {
  @override
  _Forgot_ScreenState createState() => _Forgot_ScreenState();
}

class _Forgot_ScreenState extends State<Forgot_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WhiteTopClipper(),
            child: Container(
              color: kGrey,
            ),
          ),
          ClipPath(
            clipper: GreyTopClipper(),
            child: Container(
              color: kBlue,
            ),
          ),
          ClipPath(
            clipper: BlueTopClipper(),
            child: Container(
              color: kWhite,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kPaddingL),
              child: Column(
                children: <Widget>[
                  Header(),
                  Spacer(),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Form(
                child: Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 320),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //start here
                      ForgotHeading(),
                      InputEmail(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForgotHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        width: 150,
        height: 30,
        child: Text(
          "Reset Password",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class InputEmail extends StatefulWidget {
  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  String email1 = "";
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Email";
                } else {
                  email1 = value;
                }
                return null;
              },
              style: TextStyle(
                color: Color(0xFF86879a),
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Color(0xFF8a8e9a),
                  ),
                  labelText: 'Enter Registered Email',
                  labelStyle: TextStyle(
                    color: Color(0xFF8a8e9a),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF8a8e9a),
                    ),
                  ),
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ButtonTheme(
                height: 50,
                child: RaisedButton(
                  elevation: 3,
                  child: Text('Get Verification Link'),
                  color: Color(0xFF3b7dfb),
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email1)
                          .then((value) => print("Check Mails"));
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ButtonTheme(
                height: 50,
                child: RaisedButton(
                    elevation: 3,
                    child: Text(
                      'Go to Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color(0xFF2c3242),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login1(),
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
