import 'package:flutter/material.dart';
import 'package:sakecblue/Login/Login2//constants.dart';
import 'package:sakecblue/Login/Login2//screens/login/widgets/custom_clippers/index.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Login/Login2/screens/login/widgets/header.dart';
import 'package:sakecblue/Login/auth.dart';
import 'package:sakecblue/Login/provider.dart';
import 'package:sakecblue/Login/validators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../validators.dart';
import 'forgot.dart';

String _p = "";

class Login1 extends StatelessWidget {
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
            return Login();
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    } else if (state == 'number') {
      setState(() {
        _formType = FormType.number;
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
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 320),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
    if (_formType == FormType.login || _formType == FormType.register) {
      debugPrint('inside build input');
      return [
        TextFormField(
          style: TextStyle(
            color: Color(0xFF8a8e9a),
          ),
          validator: EmailValidator.validate,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xFF86879a),
              ),
              labelText: 'Email',
              hintText: 'Email',
              labelStyle: TextStyle(
                color: Color(0xFF8a8e9a),
              ),
              enabledBorder: const OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF8a8e9a))),
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          onSaved: (value) => _email = value.trim(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter Password";
              } else {
                _p = value;
              }
              return null;
            },
            style: TextStyle(
              color: Color(0xFF86879a),
            ),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xFF8a8e9a),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color(0xFF8a8e9a),
                ),
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF8a8e9a),
                  ),
                ),
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0))),
            obscureText: true,
            onSaved: (value) => _password = value,
          ),
        ),
      ];
    } else {
      return [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: TextFormField(
//                  validator: PhoneNumberValidator.validate,
                  style: TextStyle(
                    color: Color(0xFF8a8e9a),
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'eg. 9422130234',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF8a8e9a),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xFF8a8e9a),
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xFF8a8e9a),
                    )),
                    hintStyle:
                        TextStyle(color: Color(0xFF8a8e9a), letterSpacing: 1.3),
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
              color: Color(0xFF8a8e9a),
            ),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Enter OTP',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF8a8e9a),
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xFF8a8e9a),
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xFF8a8e9a),
              )),
              hintStyle:
                  TextStyle(color: Color(0xFF8a8e9a), letterSpacing: 1.3),
            ),
            onChanged: (val) {
              setState(() {
                this.smsCode = val;
              });
            },
          ),
        ),
      ];
    }
  }

  List<Widget> buildButtons() {
    if (_formType == FormType.login) {
      return [
        Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forgot_Screen()),
                );
              },
              child: Container(
                width: 200,
                height: 20,
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ButtonTheme(
            height: 50.0,
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
          padding: const EdgeInsets.only(top: 15),
          child: ButtonTheme(
            height: 50.0,
            child: RaisedButton(
              elevation: 3,
              child: Text(
                'Create Account',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF2c3242),
              onPressed: () {
                switchFormState('register');
              },
            ),
          ),
        ),
        SizedBox(height: 30.0),
        Padding(
          padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 15),
          child: ButtonTheme(
            height: 50,
            child: RaisedButton(
              elevation: 3,
              color: Color(0xFF3b7dfb),
              child: Center(
                child: Text(
                  'Login with Number',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                switchFormState('number');
//              try {
//                final _auth = Provider.of(context).auth;
//                final id = await _auth.signInWithGoogle();
//                print('signed in with google $id');
//              } catch (e) {
//                print(e);
//              }
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //SizedBox(height: 10),
        ButtonTheme(
          height: 50,
          child: RaisedButton(
            elevation: 3,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[300], width: 1)),
            color: kWhite,
            textColor: kBlack.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'images/google_logo.png',
                    height: 48,
                  ),
                  Text('Sign in with Google'),
                ],
              ),
            ),
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
    } else if (_formType == FormType.number) {
      return [
        Padding(
          padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 15),
          child: ButtonTheme(
            height: 50,
            child: RaisedButton(
              elevation: 3,
              color: Color(0xFF3b7dfb),
              child: Center(
                child: Text(
                  'Login with Number',
                  style: TextStyle(color: Colors.white),
                ),
              ),
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
                switchFormState('login');
              },
            ),
          ),
        )
      ];
    } else {
      return [
        SizedBox(
          height: 6,
        ),
        TextFormField(
          validator: (value) {
            if (value != _p) {
              return "Password doesn't match";
            }
            return null;
          },
          obscureText: true,
          style: TextStyle(
            color: Color(0xFF8a8e9a),
          ),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF86879a),
              ),
              labelText: 'Confirm Password',
              hintText: 'Confirm Password',
              labelStyle: TextStyle(
                color: Color(0xFF8a8e9a),
              ),
              enabledBorder: const OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF8a8e9a))),
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0))),
          onSaved: (value) => _email = value.trim(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ButtonTheme(
            height: 50,
            child: RaisedButton(
              elevation: 3,
              child: Text('Create Account'),
              color: Color(0xFF3b7dfb),
              onPressed: submit,
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
                switchFormState('login');
              },
            ),
          ),
        )
      ];
    }
  }
}
