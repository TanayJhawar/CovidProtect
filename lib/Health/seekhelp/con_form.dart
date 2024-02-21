import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Health/mentalhealth/healthcenter.dart';

import '../../page_transition.dart';

class Myform extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Myform> {
  List<String> attachments = [];
  bool isHTML = false;
  // ignore: non_constant_identifier_names
  final form_emailid = TextEditingController(
    text: '',
  );
  // ignore: non_constant_identifier_names
  final form_phoneno = TextEditingController(text: '');
  // ignore: non_constant_identifier_names
  final form_name = TextEditingController(text: '');
  // ignore: non_constant_identifier_names
  final form_body = TextEditingController(
    text: '',
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> send() async {
    final Email email = Email(
      body: 'Name: ' +
          form_name.text +
          '\nEmail Id: ' +
          form_emailid.text +
          '\nPhone Number: ' +
          form_phoneno.text +
          '\n Problem Faced : ' +
          form_body.text,
      subject: 'Counselling Appointment Request',
      recipients: ['Sakecblue.counselor@gmail.com'],
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
    void _toDash() {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }

    return WillPopScope(
        onWillPop: () {
          _toDash();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              // onPressed: () => Navigator.push(
              //   context,
              //   PageTransition(
              //       type: PageTransitionType.rightToLeftWithFade,
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
                "Counsellor Help",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: send,
                icon: Icon(Icons.send),
              )
            ],
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: form_name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Name',
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: form_emailid,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Email-Id',
                        labelText: 'Email-Id',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: form_phoneno,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Phone Number',
                        labelText: 'Phone Number',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: form_body,
                      maxLines: 10,
                      decoration: InputDecoration(
                          hintText: 'Problem Faced/Mental Guidance',
                          labelText: 'Problem Faced',
                          border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
