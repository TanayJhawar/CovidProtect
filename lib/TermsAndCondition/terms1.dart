import 'dart:ui';
import 'package:sakecblue/Login/Login2/screens/login/login.dart';
import 'package:sakecblue/Login/login.dart';
import 'package:flutter/material.dart';

class Terms1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    void _toDash() {
//      Navigator.of(context).popUntil((route) => route.isFirst);
//    }
//
//    return WillPopScope(
//        onWillPop: () {
//          _toDash();
//        },

        return Scaffold(
//    appBar: AppBar(
//    leading: IconButton(
//        icon: Icon(Icons.arrow_back, color: Colors.black),
//    onPressed: () {
//    Navigator.of(context).popUntil((route) => route.isFirst);
//    },
//    ),
//    backgroundColor: Colors.blue[900],
//    elevation: 0,
//    ),
        body: SingleChildScrollView(
          child: Baselayout1(),
        ));
  }
}

class Baselayout1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 50.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Terms & Condition",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 35.0,
                  fontFamily: 'Bebas',
                ),
              ),
            ),
            Row(
              children: <Widget>[],
            ),
            C3(),
            Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('I Agree'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                )),
          ],
        ));
  }
}

class C3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'SAKEC Blue PRIVACY POLICY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "When you use SAKEC Blue (App), some personal information is collected from and about you. We are committed to protecting the security of this information and safeguarding your privacy. This privacy policy sets out the details of the personal information collected, the manner in which it is collected, by whom as well as the purposes for which it is used. At registration you accepted the terms of this Privacy Policy and your use of the App signifies your continued acceptance thereof. This Privacy Policy may be revised from time to time and you will be notified of all such changes. ",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '1. INFORMATION COLLECTED AND MANNER OF COLLECTION',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "A.   When you register on the App, the following information is collected from you and stored securely on a server operated and managed by the server  – (i) name; (ii) phone number; (iii) age; (iv) sex; (v) email id; and (vi) countries visited in the last 30 days. This information will be stored on the Server and a unique digital id (DiD) will be pushed to your App. The DiD will thereafter be used to identify you in all subsequent App related transactions and will be associated with any data or information uploaded from the App to the Server. At registration, your location details are also captured and uploaded to the Server.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "B.   When two registered users come within Bluetooth range of each other, their Apps will automatically exchange DiDs and record the time and GPS location at which the contact took place. The information that is collected from your App will be securely stored on the mobile device of the other registered user and will not be accessible by such other users. In the event such other registered user tests positive for COVID-19, this information will be securely uploaded from his/her mobile device and stored on the Server.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "C.   Each time you complete a self-assessment test the App will collect your location data and upload it along with the results of your self-assessment and your DiD to the Server.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "D.   The App continuously collects your location data and stores securely on your mobile device, a record of all the places you have been at 15 minute intervals. This information will only be uploaded to the Server along with your DiD, (i) if you test positive for COVID-19; and/or (ii) if your self-declared symptoms indicate that you are likely to be infected with COVID-19; and/or (iii) if the result of your self-assessment test is either YELLOW or ORANGE. For the avoidance of doubt, this information will NOT be uploaded to the Server if you are not unwell or if the result of your self-assessment test is GREEN.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '2. Permission ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "A.   GPS - App is based on location and therefore the user is asked for permission to turn on their location services while using the app or in the background.App uses location for contact tracing and giving the shortest distance between two places for travel.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "B.   Bluetooth - Permission of enabling bluetooth is asked to find how many cases are there in nearby. Bluetooth helps with contact tracing giving information for how many times the person was in contact with another user.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '3. USE OF INFORMATION',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "A.   The personal information collected from you at the time of registration under Clause 1(a) above, will be stored on the Server and only be used in anonymized, aggregated datasets for the purpose of generating reports, heat maps and other statistical visualisations for the purpose of the management of COVID-19 in the country or to provide you general notifications pertaining to COVID-19 as may be required. Your DiD will only be co-related with your personal information in order to communicate to you the probability that you have been infected with COVID-19 and/or to provide persons carrying out medical and administrative interventions necessary in relation to COVID-19, the information they might need about you in order to carry out such interventions.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "B.   The information collected from any other user’s mobile device and uploaded and stored on the Server in accordance with Clause 1(b) will be used to calculate your probability of having been infected with COVID-19.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "C.   The information collected under Clause 1(c) will be used by the server to evaluate, based on the self-assessment tests and the GPS locations from where they are being uploaded, whether a disease cluster is developing at any geographic location.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "D.   The information collected under Clause 1(d) and securely uploaded and stored on the Server will, in the event you have tested positive for COVID-19, be used to map the places you visited over the past 30 days in order to identify the locations that need to be sanitised and where people need to be more deeply tested and identify emerging areas where infection outbreaks are likely to occur. Where, in order to more accurately map the places you visited and/or the persons who need to be deeply tested, your personal information is required, the DiD associated with the information collected under Clause 1(d) will be correlated with your personal information collected under Clause 1(a).",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "E.   The information collected under Clause 1 will not be used for any purpose other than those mentioned in this Clause 2.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '4. RETENTION',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              "A.   All personal information collected from you under Clause 1(a) at the time of registration will be retained for as long as your account remains in existence and if any medical or administrative interventions have been commenced under Clause 2, subject to Clause 3(b) below, for such period thereafter as is required for such interventions to be completed.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "B.   All personal information collected under Clauses 1(b), 1(c) and 1(d) will be retained on the mobile device for a period of 15 days from the date of collection after which, if it has not already been uploaded to the Server, will be purged from the App. All information collected under Clauses 1(b), 1(c) and 1(d)  and uploaded to the Server will, to the extent that such information relates to people who have not tested positive for COVID-19, will be purged from the Server 15 days after being uploaded. All information collected under Clauses 1(b), 1(c) and 1(d) of persons who have tested positive for COVID-19 will be purged from the Server 15 days after such persons have been declared cured of COVID-19.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "C.   Nothing set out herein shall apply to the anonymized, aggregated datasets generated by the personal data of registered users of the App or any reports, heat maps or other visualization created using such datasets. Nothing set out herein shall apply to medical reports, diagnoses or other medical information generated by medical professionals in the course of treatment.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '5. RIGHTS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "  You cannot manage the communications that you receive from us or how you receive them. If you no longer wish to receive communications from us, you may cancel your registration. If you cancel your registration, all the information you had provided to us will be deleted after the expiration of 15 days from the date of such cancellation.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '6. DATA SECURITY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "  The App is equipped with standard security features to protect the confidentiality and security of your information. Data is encrypted in transit as well as at rest. Personal information provided at the time of registration is encrypted before being uploaded to the cloud where it is stored in a secure encrypted server. Personal information that is stored in the Apps of other registered users that you come in contact with is securely encrypted and are incapable of being accessed by such users.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '7. DISCLOSURES AND TRANSFER',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
            ),
            Text(
              "  Save as otherwise set out in Clause 2 with respect to information provided to persons carrying out medical and administrative interventions necessary in relation to COVID-19, no personal information collected by the App will be disclosed or transferred to any third party.",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
          ],
        ));
  }
}