import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/FAQ/faq_grid.dart';

import '../page_transition.dart';

class AboutFaq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Covid protect",
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 600),
                  child: FaqGrid()),
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "Categories",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          elevation: 0,
        ),
        body: AboutFaqlayout(),
      ),
    );
  }
}

class AboutFaqlayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[QuestAns(), QuestAns(), QuestAns()],
      ),
    );
  }
}

class QuestAns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: Color(0xffededed),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3779FF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.02,
                      height: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Q. ",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff3779FF),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                " Sample question",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ))
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffededed),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.02,
                      height: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: <Widget>[
                            Center(
                              child: Text(
                                "A. ",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                " Sample question",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
