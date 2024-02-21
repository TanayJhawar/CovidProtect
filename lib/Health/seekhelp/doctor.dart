import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Health/seekhelp/doc_form.dart';
import 'package:sakecblue/Health/seekhelp/con_form.dart';
import 'package:sakecblue/Health/seekhelp/pat_form.dart';

import '../../page_transition.dart';

class Doc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomePageState();
  }
}

class HomePage1 extends StatefulWidget {
  @override
  _Page1 createState() => _Page1();
}

class HomePage3 extends StatefulWidget {
  @override
  _Page3 createState() => _Page3();
}

class _HomePageState extends StatelessWidget {
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
                "E Scheduling",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            elevation: 0,
          ),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
                  child: ButtonsTabBar(
                    radius: 20.0,
                    backgroundColor: Color(0xFF3b7dfb),
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        text: "Consultancy",
                      ),
                      Tab(
                        text: "Doctor's Advice",
                      ),
                    ],
                  ),
                ),
                new Container(),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Center(
                        child: HomePage1(),
                      ),
                      Center(
                        child: HomePage3(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class _Page1 extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                'images/app_logo.png',
                height: 130,
              ),
            ),
            Container(
              child: ListTile(
                title: Center(
                  child: Text(
                    'Ms. Hitakshi Joshi\n',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Text(
                    'Student counselor, SAKEC\n\nTrained & Certified in Advanced  RE-CBT Therapy  for Children and Adults from Albert Ellis Institute (New York).',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
            RaisedButton(
              color: Color(0xFF3b7dfb),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Myform()));
              },
              child: Text(
                'Request Appointment',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final halfMediaHeight = MediaQuery.of(context).size.height / 2.0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => FormScreen()),
                // );
                Scaffold.of(context).showSnackBar(SnackBar(
                    content:
                        Text("Doctor Registration shall be avaialbe soon.")));
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                //alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'images/doc.jpg',
                      height: 130,
                    ),
                    new Container(
                      child: ListTile(
                        title: Text(
                          'DOCTOR Registartion',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage3()),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                //alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      'images/pat1.jpg',
                      height: 130,
                    ),
                    new ListTile(
                      title: Text(
                        'PATIENT Registration',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _Page3 extends State<HomePage3> {
  QuerySnapshot doc;

  getData() async {
    final response =
        await Firestore.instance.collection('doctor').getDocuments();
    if (response == null) {
      return CircularProgressIndicator();
    } else {
      return response;
    }
  }

  @override
  void initState() {
    getData().then((results) {
      setState(() {
        doc = results;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back, color: Colors.black),
//          onPressed: () => Navigator.push(
//            context,
//            PageTransition(
//                type: PageTransitionType.rightToLeft,
//                duration: Duration(milliseconds: 600),
//                child: Dash()),
//          ),
//        ),
//        backgroundColor: Colors.white,
//        iconTheme: new IconThemeData(color: Colors.black),
//        title: Padding(
//          padding: const EdgeInsets.only(top: 5.0),
//          child: Text(
//            "Doctors",
//            style: TextStyle(
//              color: Colors.black,
//              fontSize: 27.0,
//              fontFamily: 'bebas',
//            ),
//          ),
//        ),
//        elevation: 0,
//      ),
      body: doc == null
          ? Container(
              child: Center(
                child: Text("Loading..."),
              ),
            )
          : ListView.builder(
              itemCount: doc.documents.length,
              itemBuilder: (context, i) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new ListTile(
                            trailing: CircleAvatar(
                              backgroundImage: AssetImage('images/doct.jpeg'),
                              radius: 35.0,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                doc.documents[i].data['name'],
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              doc.documents[i].data['degree'] +
                                  '\n' +
                                  doc.documents[i].data['organisation'],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              color: Color(0xFF3b7dfb),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                              elevation: 3,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FillForm(
                                      doc.documents[i].data['email'],
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Request Appointment',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
