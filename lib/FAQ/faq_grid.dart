import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';

import '../page_transition.dart';
import 'AboutFaq.dart';

class FaqGrid extends StatelessWidget {
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
                "FAQ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            elevation: 0,
          ),
          body: FaqgridLayout(),
        ));
  }
}

class FaqgridLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutFaq()),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: MediaQuery.of(context).size.width * 0.68,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 2.0,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage("images/faq/ab.png"),
                                  fit: BoxFit.scaleDown,
                                )),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text("About"),
                                  ),
                                )),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          //link here
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: MediaQuery.of(context).size.width * 0.48,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage("images/faq/ft.png"),
                                fit: BoxFit.scaleDown,
                              )),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("Key Features"),
                                ),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: GestureDetector(
                          onTap: () {
                            //link here
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: MediaQuery.of(context).size.width * 0.48,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 2.0,
                                  ),
                                ],
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage("images/faq/org.png"),
                                  fit: BoxFit.scaleDown,
                                )),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text("Organisations"),
                                  ),
                                )),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: GestureDetector(
                          onTap: () {
                            //link here
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: MediaQuery.of(context).size.width * 0.68,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 2.0,
                                  ),
                                ],
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage("images/faq/sec.png"),
                                  fit: BoxFit.scaleDown,
                                )),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text("Privacy & Security"),
                                  ),
                                )),
                          ),
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
