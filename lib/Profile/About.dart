//import 'package:flutter/material.dart';
//
//class Profile extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: "Covid protect",
//      home: Scaffold(
//        backgroundColor: Colors.white,
//        appBar: AppBar(
//          backgroundColor: Colors.white,
//          iconTheme: new IconThemeData(color: Colors.black),
//          title: Padding(
//            padding: const EdgeInsets.only(top: 5.0),
//            child: Text(
//              "About Us",
//              style: TextStyle(
//                color: Colors.black,
//                fontSize: 27.0,
//                fontFamily: 'bebas',
//              ),
//            ),
//          ),
//          elevation: 0,
//        ),
//        body: Profile1(),
//      ),
//    );
//  }
//}
//
//class Profile1 extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.all(15),
//      child: Container(
//        child: Column(
//          children: <Widget>[
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Column(
//                  children: <Widget>[
//                    Padding(
//                        padding: EdgeInsets.only(top: 5, bottom: 5),
//                        child: GestureDetector(
//                          onTap: () {
////                            Navigator.push(
////                              context,
////                              MaterialPageRoute(
////                                  builder: (context) => AboutFaq()),
////                            );
//                          },
//                          child: Container(
//                            width: MediaQuery.of(context).size.width * 0.44,
//                            height: MediaQuery.of(context).size.width * 0.50,
//                            decoration: BoxDecoration(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(10)),
//                              color: Color(0xFF4d478d),
//                              boxShadow: <BoxShadow>[
//                                BoxShadow(
//                                  color: Colors.grey,
//                                  offset: Offset(1.0, 1.0),
//                                  blurRadius: 2.0,
//                                ),
//                              ],
////                                image: DecorationImage(
////                                  image: AssetImage("images/faq/ab.png"),
////                                  fit: BoxFit.scaleDown,
////                                )
//                            ),
//                            child: Column(
//                              children: <Widget>[
//                                Align(
//                                    alignment: Alignment.topLeft,
//                                    child: Padding(
//                                      padding: EdgeInsets.all(10),
//                                      child: Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          "Shah & Anchor Kutchhi Engineering College",
//                                          style: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: 20),
//                                        ),
//                                      ),
//                                    )),
//                                Padding(
//                                    padding: const EdgeInsets.only(left: 80),
//                                    child: CircleAvatar(
//                                      radius: 30,
//                                      backgroundImage:
//                                          AssetImage('images/SAKEC.jpeg'),
//                                    )
////                                  Image(
////                                    width: 70,
////                                    height: 70,
////                                    image: AssetImage("images/SAKEC.jpeg"),
////                                    fit: BoxFit.scaleDown,
////                                  ),
//                                    )
//                              ],
//                            ),
//                          ),
//                        )),
//                    Padding(
//                        padding: EdgeInsets.only(top: 5, bottom: 5),
//                        child: GestureDetector(
//                          onTap: () {
////                            Navigator.push(
////                              context,
////                              MaterialPageRoute(
////                                  builder: (context) => AboutFaq()),
////                            );
//                          },
//                          child: Container(
//                            width: MediaQuery.of(context).size.width * 0.44,
//                            height: MediaQuery.of(context).size.width * 0.39,
//                            decoration: BoxDecoration(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(10)),
//                              color: Color(0xFF4280f1),
//                              boxShadow: <BoxShadow>[
//                                BoxShadow(
//                                  color: Colors.grey,
//                                  offset: Offset(1.0, 1.0),
//                                  blurRadius: 2.0,
//                                ),
//                              ],
////                                image: DecorationImage(
////                                  image: AssetImage("images/faq/ab.png"),
////                                  fit: BoxFit.scaleDown,
////                                )
//                            ),
//                            child: Column(
//                              children: <Widget>[
//                                Align(
//                                    alignment: Alignment.topLeft,
//                                    child: Padding(
//                                      padding: EdgeInsets.all(10),
//                                      child: Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          "Blue Eye \nSoft Corp",
//                                          style: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: 20),
//                                        ),
//                                      ),
//                                    )),
//                                Padding(
//                                    padding: const EdgeInsets.only(
//                                        left: 80, top: 15, right: 10),
//                                    child: Align(
//                                      alignment: Alignment.bottomRight,
//                                      child: CircleAvatar(
//                                        radius: 30,
//                                        backgroundImage: AssetImage(
//                                            'images/BLUE_EYE_SOFT.jpeg'),
//                                      ),
//                                    ))
//                              ],
//                            ),
//                          ),
//                        )),
//                  ],
//                ),
//                Column(
//                  children: <Widget>[
//                    Padding(
//                        padding: EdgeInsets.only(top: 5, bottom: 5),
//                        child: GestureDetector(
//                          onTap: () {
////                            Navigator.push(
////                              context,
////                              MaterialPageRoute(
////                                  builder: (context) => AboutFaq()),
////                            );
//                          },
//                          child: Container(
//                            width: MediaQuery.of(context).size.width * 0.44,
//                            height: MediaQuery.of(context).size.width * 0.45,
//                            decoration: BoxDecoration(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(10)),
//                              color: Color(0xFF4280f1),
//                              boxShadow: <BoxShadow>[
//                                BoxShadow(
//                                  color: Colors.grey,
//                                  offset: Offset(1.0, 1.0),
//                                  blurRadius: 2.0,
//                                ),
//                              ],
////                                image: DecorationImage(
////                                  image: AssetImage("images/faq/ab.png"),
////                                  fit: BoxFit.scaleDown,
////                                )
//                            ),
//                            child: Column(
//                              children: <Widget>[
//                                Align(
//                                    alignment: Alignment.topLeft,
//                                    child: Padding(
//                                      padding: EdgeInsets.all(10),
//                                      child: Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          "Blue Eye \nSoft Corp",
//                                          style: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: 20),
//                                        ),
//                                      ),
//                                    )),
//                                Padding(
//                                    padding: const EdgeInsets.only(
//                                        left: 80, top: 15, right: 10),
//                                    child: Align(
//                                      alignment: Alignment.bottomRight,
//                                      child: CircleAvatar(
//                                        radius: 30,
//                                        backgroundImage: AssetImage(
//                                            'images/BLUE_EYE_SOFT.jpeg'),
//                                      ),
//                                    ))
//                              ],
//                            ),
//                          ),
//                        )),
//                    Padding(
//                        padding: EdgeInsets.only(top: 5, bottom: 5),
//                        child: GestureDetector(
//                          onTap: () {
////                            Navigator.push(
////                              context,
////                              MaterialPageRoute(
////                                  builder: (context) => AboutFaq()),
////                            );
//                          },
//                          child: Container(
//                            width: MediaQuery.of(context).size.width * 0.44,
//                            height: MediaQuery.of(context).size.width * 0.40,
//                            decoration: BoxDecoration(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(10)),
//                              color: Color(0xFF4d478d),
//                              boxShadow: <BoxShadow>[
//                                BoxShadow(
//                                  color: Colors.grey,
//                                  offset: Offset(1.0, 1.0),
//                                  blurRadius: 2.0,
//                                ),
//                              ],
////                                image: DecorationImage(
////                                  image: AssetImage("images/faq/ab.png"),
////                                  fit: BoxFit.scaleDown,
////                                )
//                            ),
//                            child: Column(
//                              children: <Widget>[
//                                Align(
//                                    alignment: Alignment.topLeft,
//                                    child: Padding(
//                                      padding: EdgeInsets.all(10),
//                                      child: Align(
//                                        alignment: Alignment.topLeft,
//                                        child: Text(
//                                          "Blue Eye \nSoft Corp",
//                                          style: TextStyle(
//                                              color: Colors.white,
//                                              fontSize: 20),
//                                        ),
//                                      ),
//                                    )),
//                                Padding(
//                                    padding: const EdgeInsets.only(
//                                        left: 80, top: 15, right: 10),
//                                    child: Align(
//                                      alignment: Alignment.bottomRight,
//                                      child: CircleAvatar(
//                                        radius: 30,
//                                        backgroundImage: AssetImage(
//                                            'images/BLUE_EYE_SOFT.jpeg'),
//                                      ),
//                                    )
////                                  Image(
////                                    width: 70,
////                                    height: 70,
////                                    image: AssetImage("images/SAKEC.jpeg"),
////                                    fit: BoxFit.scaleDown,
////                                  ),
//                                    )
//                              ],
//                            ),
//                          ),
//                        )),
//                  ],
//                ),
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Profile/sakecteam.dart';
import 'package:url_launcher/url_launcher.dart';

import '../page_transition.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              icon: Icon(Icons.arrow_back, color: Colors.white),
              // onPressed: () => Navigator.push(
              //   context,
              //   PageTransition(
              //       type: PageTransitionType.leftToRight,
              //       duration: Duration(milliseconds: 600),
              //       child: Dash()),
              // ),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            backgroundColor: Colors.blue[900],
            elevation: 0,
          ),
          body: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            width: double.infinity,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  width: 100,
                  color: Colors.blue[900],
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/app_logo.png',
                        height: 130,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'YOUR SAFETY IS OUR PRIORITY',
                          style: TextStyle(
                              color: Color.fromARGB(255, 56, 185, 166),
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text(
                          'CovidProtect is your SAFE WAY THROUGH this pandemic. We believe in keeping you and your loved ones safe.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => launch('http://blueyesoft.com/'),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
                    child: Container(
                      child: FittedBox(
                        child: Material(
                          color: Colors.white,
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Colors.grey,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 60,
                                height: 30,
                                child: ClipRRect(
                                  child: GestureDetector(
                                    child: Image(
                                      height: 10,
                                      alignment: Alignment.center,
                                      image: AssetImage(
                                          'images/BLUE_EYE_SOFT.jpeg'),
                                    ),

                                    //link for doctor /medicine
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => launch('http://blueyesoft.com/'),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 0.0,
                                      right: 5.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: Row(children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Blue Eye Soft Corp.",
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontFamily: 'KronaOne',
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => launch('http://blueyesoft.com/'),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Container(
                      child: FittedBox(
                        child: Material(
                          color: Colors.white,
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Colors.grey,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 85,
                                height: 40,
                                child: ClipRRect(
                                  child: GestureDetector(
                                    child: Image(
                                      height: 10,
                                      alignment: Alignment.center,
                                      image: AssetImage('images/SAKEC.jpeg'),
                                    ),

                                    //link for doctor /medicine
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => launch('http://blueyesoft.com/'),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 0.0,
                                      right: 5.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: Row(children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Shah & Anchor Kutchhi \nEngineering College",
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 9,
                                              fontFamily: 'KronaOne',
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => launch('http://blueyesoft.com/'),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Container(
                      child: FittedBox(
                        child: Material(
                          color: Colors.white,
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Colors.grey,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 60,
                                height: 30,
                                child: ClipRRect(
                                  child: GestureDetector(
                                    child: Image(
                                      height: 10,
                                      alignment: Alignment.center,
                                      image: AssetImage(
                                          'images/BLUE_EYE_SOFT.jpeg'),
                                    ),

                                    //link for doctor /medicine
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => launch('http://blueyesoft.com/'),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 0.0,
                                      right: 5.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  child: Row(children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "SAKECBlue Team",
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              fontFamily: 'KronaOne',
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => launch('http://blueyesoft.com/'),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Container(
                      child: FittedBox(
                        child: Material(
                          color: Colors.white,
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Colors.grey,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 35,
                                height: 18,
                                child: ClipRRect(
                                  child: GestureDetector(
                                    child: Image(
                                      height: 10,
                                      alignment: Alignment.center,
                                      image: AssetImage(
                                          'images/BLUE_EYE_SOFT.jpeg'),
                                    ),

                                    //link for doctor /medicine
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => launch('http://blueyesoft.com/'),
                                child: Container(
//                              margin: EdgeInsets.only(
//                                  left: 0.0,
//                                  right: 5.0,
//                                  top: 10.0,
//                                  bottom: 10.0),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Row(children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Research Cell",
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 5,
                                              fontFamily: 'KronaOne',
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
//            GestureDetector(
//              //onTap: () => launch('http://sakec.ai/'),
//              onTap: () {
//                Navigator.push(
//                    context, MaterialPageRoute(builder: (context) => FAQ()));
//              },
//              child: Padding(
//                padding: const EdgeInsets.all(16.0),
//                child: Container(
//                  child: FittedBox(
//                    child: Material(
//                      color: Colors.white,
//                      elevation: 3.0,
//                      borderRadius: BorderRadius.circular(5.0),
//                      shadowColor: Colors.grey,
//                      child: Row(
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(left: 0.0, right: 0),
//                            padding: EdgeInsets.fromLTRB(0.0, 5, 0, 5),
//                            width: 40,
//                            height: 35,
//                            child: ClipRRect(
//                              child: GestureDetector(
//                                child: Image.asset(
//                                  'images/faq.jpg',
//                                ),
//
//                                //link for doctor /medicine
//                              ),
//                            ),
//                          ),
//                          GestureDetector(
//                            onTap: () {
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => FAQ()));
//                            },
//                            child: Container(
//                              margin: EdgeInsets.only(
//                                  left: 0.0,
//                                  right: 5.0,
//                                  top: 10.0,
//                                  bottom: 10.0),
//                              child: Row(children: <Widget>[
//                                Container(
//                                  padding: EdgeInsets.only(left: 10, right: 25),
//                                  child: Column(
//                                    children: <Widget>[
//                                      Text(
//                                        "FAQs",
//                                        textDirection: TextDirection.ltr,
//                                        style: TextStyle(
//                                          color: Colors.blue,
//                                          fontSize: 8.5,
//                                          fontFamily: 'KronaOne',
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                )
//                              ]),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ),
              ],
            ),
          ),
        ));
  }
}
