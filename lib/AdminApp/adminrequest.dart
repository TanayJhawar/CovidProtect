

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'adminfirst.dart';
import 'adminlogin.dart';


class AdminReq extends StatefulWidget {
  @override
  _AdminReqState createState() => _AdminReqState();
}

class _AdminReqState extends State<AdminReq> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "sample text",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
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
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {

                  Navigator.of(context).popUntil((route) => route.isFirst);

              },
            ),
            backgroundColor: Colors.white,
            iconTheme: new IconThemeData(color: Colors.black),
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                "Admin Panel",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            elevation: 0,
          ),
          body: Baselayout(),
        ) );
  }
}
class Baselayout extends StatefulWidget {
  @override
  _Baselayout createState() => _Baselayout();
}
class _Baselayout extends State<Baselayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[

           // Padding(
             // padding: const EdgeInsets.only(
               //   left: 10.0, top: 10.0, right: 10.0),
               Column(
                children: <Widget>[
                  Card(),
                  Text(
                  'Your organization has to be verified to avail the Admin part of CovidProtect',
                  textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Colors.black),
                  ),

                  Container(

                    child: RaisedButton(

                      color: Colors.black,

                      onPressed: () {
                        send();
                      },

                      child: Center(
                        child: Text(
                          'Request Credentials',
                          style: TextStyle(
                            color: Colors.white,fontSize: 15,
                          ),
                        ),),
                        elevation: 5,
                    ),),
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                          "Already Requested?"
                      )
                  ),


                  Container(

                    child: RaisedButton(

                      color: Colors.black,

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },

                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,fontSize: 15,
                          ),
                        ),),
elevation: 5,
                    ),),
                ],),
          ],
        )
    );
  }

  bool isHTML = false;

  Future<void> send() async {
    final Email email = Email(
      body: 'To whomsoever it may concern,\n \n'
          'I am (name) representing (organization name) with the position of (designation). I sincerely state that,'
      ' I will be using the admin part for the benefit of my organization and to join in the public goal of fighting against this virus.\n\n'
    'Thanks and regards,\n'
    '(Name)',
      subject: 'Request for Admin Credentials',
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

  }
}


showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('Dialog');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>AdminReq()),
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Success"),
    content: Text("Your request is successfully sent. We will provide you the admin credentials as soon as possible."),
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


class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


             return Column(
mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text(
                    'Admin App is a custom part created crucially for your administration',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Bebas", fontSize: 30, color: Colors.black),

                  ),

                  Text(
                    'The Admin Part is going to help you validate and keep track of the number of cases in your organization',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Colors.black),
                  ),
                  Divider(
                    height: 20,
                  ),
                  Image(image: AssetImage('images/admin/app.png')),
                  Divider(
                    height: 20,
                  ),
                ]);




  }
}