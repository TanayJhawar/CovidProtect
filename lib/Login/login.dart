import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';

import 'package:sakecblue/Login/auth.dart';
import 'package:sakecblue/Login/provider.dart';
import 'package:sakecblue/Login/validators.dart';

import 'package:shared_preferences/shared_preferences.dart';


class Log extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SAKECBlue',
        theme: ThemeData.dark(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future<void> setloggedin(value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool loggedIn = snapshot.hasData;
          if (loggedIn == true) {
            setloggedin(true);
            return Dash();
          } else {
            setloggedin(false);
            return LoginPage();
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  String PhoneNo, verificationId, smsCode;
  String _email, _password;
  FormType _formType = FormType.login;

  bool validate() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()) {
      try {
        final auth = Provider.of(context).auth;
        if (_formType == FormType.login) {
          String userId = await auth.signInWithEmailAndPassword(
            _email,
            _password,
          );
          print(_password);

          print('Signed in $userId');
        } else {
          String userId = await auth.createUserWithEmailAndPassword(
            _email,
            _password,
          );
          Fluttertoast.showToast(msg: "User Registered!");
          print('Registered in $userId');
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "Email ID or Password is Wrong");
        print(e);
      }
    }
  }

  void switchFormState(String state) {
    formKey.currentState.reset();

    if (state == 'register') {
      setState(() {
        _formType = FormType.register;
      });
    } else {
      setState(() {
        _formType = FormType.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        title: Text(
          'Login/Register',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 35.0,
            fontFamily: 'Bebas',
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
//        resizeToAvoidBottomInset: false,
//        body: Stack(children: <Widget>[
//          ClipPath(
//            clipper: WhiteTopClipper(),
//            child: Container(
//              color: kGrey,
//            ),
//          ),
//          ClipPath(
//            clipper: GreyTopClipper(),
//            child: Container(
//              color: kBlue,
//            ),
//          ),
//          ClipPath(
//            clipper: BlueTopClipper(),
//            child: Container(
//              color: kWhite,
//            ),
//          ),
      body: Column(
        children: <Widget>[
//          TopBar(),
          SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
//                      CurvedShape(),
                      ...buildInputs(),
                      ...buildButtons(),
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

  List<Widget> buildInputs() {
    return [
      TextFormField(
        style: TextStyle(
          color: Colors.black,
        ),
        validator: EmailValidator.validate,
        decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Email',
            labelStyle: TextStyle(color: Colors.black, letterSpacing: 1.3),
            enabledBorder: const OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0))),
        onSaved: (value) => _email = value.trim(),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextFormField(
          style: TextStyle(
            color: Colors.black,
          ),
          validator: PasswordValidator.validate,
          decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.black, letterSpacing: 1.3),
              enabledBorder: const OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          obscureText: true,
          onSaved: (value) => _password = value,
        ),
      ),
    ];
  }

  List<Widget> buildButtons() {
    if (_formType == FormType.login) {
      return [
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 10, left: 0),
              child: ButtonTheme(
                minWidth: 140.0,
                height: 40.0,
                child: RaisedButton(
                  elevation: 3,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  color: Color(0xFF3b7dfb),
                  onPressed: submit,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 40, right: 0),
              child: ButtonTheme(
                minWidth: 140.0,
                height: 40.0,
                child: RaisedButton(
                  elevation: 3,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.white,
                  onPressed: () {
                    switchFormState('register');
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 50.0),
        SizedBox(
          height: 20.0,
        ),
        Row(children: <Widget>[
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                child: Divider(
                  color: Colors.black,
                  height: 50,
                )),
          ),
          Text(
            'OR',
            style: TextStyle(color: Colors.grey),
          ),
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                child: Divider(
                  color: Colors.black,
                  height: 50,
                )),
          ),
        ]),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: TextFormField(
//                  validator: PhoneNumberValidator.validate,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'eg. 9422130234',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hintStyle:
                        TextStyle(color: Colors.black, letterSpacing: 1.3),
                  ),
                  onChanged: (val) {
                    setState(() {
                      this.PhoneNo = "+91" + val.trim();
                    });
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: RaisedButton(
                  elevation: 3,
                  color: Colors.white,
                  onPressed: () async {
                    debugPrint("Send OTP");
                    Fluttertoast.showToast(
                        msg:
                            "OTP Sent to Number ${PhoneNo}, may take 10-15 sec.",
                        toastLength: Toast.LENGTH_LONG);
                    final _auth = Provider.of(context).auth;
                    // ignore: unused_local_variable
                    final id = await _auth.verifyPhoneNumber(PhoneNo);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Send OTP",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.0, right: 0.0),
          child: TextFormField(
            style: TextStyle(
              color: Colors.black,
            ),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Enter OTP',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintStyle: TextStyle(color: Colors.black, letterSpacing: 1.3),
            ),
            onChanged: (val) {
              setState(() {
                this.smsCode = val;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 15),
          child: RaisedButton(
            elevation: 5,
            color: Color(0xFF3b7dfb),
            child: Center(
              child: Text(
                'Login with Number',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () async {
              try {
                // ignore: unused_local_variable
                final _auth = Provider.of(context).auth;
                if (Provider.of(context).auth.getIfCodeSent()) {
                  final id = await Provider.of(context)
                      .auth
                      .signInWithOTP(smsCode, PhoneNo);
                  print('signed in with phoneNumber $id');
                }
              } catch (e) {
                print(e);
              }
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(children: <Widget>[
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                child: Divider(
                  color: Colors.black,
                  height: 50,
                )),
          ),
          Text(
            'OR',
            style: TextStyle(color: Colors.grey),
          ),
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                child: Divider(
                  color: Colors.black,
                  height: 50,
                )),
          ),
        ]),
        Padding(
          padding: EdgeInsets.only(top: 10, right: 0, left: 0, bottom: 10),
          child: SignInButton(
            Buttons.GoogleDark,
            text: "Sign up with Google",
            onPressed: () async {
              try {
                final _auth = Provider.of(context).auth;
                final id = await _auth.signInWithGoogle();
                print('signed in with google $id');
              } catch (e) {
                print(e);
              }
            },
          ),
        ),
      ];
    } else {
      return [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: RaisedButton(
            elevation: 5,
            child: Text('Create Account'),
            color: Color(0xFF3b7dfb),
            onPressed: submit,
          ),
        ),
        RaisedButton(
          elevation: 5,
          child: Text(
            'Go to Login',
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.white,
          onPressed: () {
            switchFormState('login');
          },
        )
      ];
    }
  }
}
