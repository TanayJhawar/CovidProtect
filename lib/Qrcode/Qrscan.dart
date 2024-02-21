import 'package:barcode_scan/barcode_scan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';

import '../page_transition.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  var riskValue;
  String qrData;
  String qrCodeResult = "Tap Open Scanner to get result";
  Future getstatus() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
//    final dbRef = FirebaseDatabase.instance.reference().child("pets");
    riskValue = (await FirebaseDatabase.instance
                .reference()
                .child('selfAssessmentUser')
                .child(firebaseUser.uid)
                .child("result")
                .once())
            .value ??
        "Low Risk";
    setState(() {
      qrData = riskValue;
    });
  }

  @override
  void initState() {
    getstatus();
    // TODO: implement initState
    super.initState();
  }

  Widget getQr() {
    if (qrData == null) {
      return SizedBox(height: 10, width: 10);
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Your QR Code",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3b7dfb),
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: QrImage(
              //plce where the QR Image will be shown
              data: qrData,
              size: MediaQuery.of(context).size.width / 1.5,
            ),
          ),
        ],
      );
    }
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
                "QR Generator",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                getQr(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          "Scan Other's QR Code",
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        qrCodeResult,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(15.0),
                        onPressed: () async {
                          var codeSanner =
                              await BarcodeScanner.scan(); //barcode scnner

                          setState(() {
                            qrCodeResult = codeSanner;
                          });

                          // try{
                          //   BarcodeScanner.scan()    this method is used to scan the QR code
                          // }catch (e){
                          //   BarcodeScanner.CameraAccessDenied;   we can print that user has denied for the permisions
                          //   BarcodeScanner.UserCanceled;   we can print on the page that user has cancelled
                          // }
                        },
                        child: Text(
                          "Open Scanner",
                          style: TextStyle(
                              color: Color(0xFF3b7dfb),
                              fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue, width: 3.0),
                            borderRadius: BorderRadius.circular(20.0)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  //its quite simple as that you can use try and catch staatements too for platform exception
}
