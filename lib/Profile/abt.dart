import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAboutus extends StatelessWidget {
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
            elevation: 0,
            backgroundColor: Colors.blue[900],
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                }),
          ),
          backgroundColor: Colors.blue[900],
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
                              color: Colors.greenAccent,
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
                          borderRadius: BorderRadius.circular(3.0),
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
                  onTap: () => launch('https://www.shahandanchor.com/home/'),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Container(
                      child: FittedBox(
                        child: Material(
                          color: Colors.white,
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(3.0),
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
                                onTap: () => launch(
                                    'https://www.shahandanchor.com/home/'),
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
                  onTap: () => launch('https://sakec.ai/team.html'),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Container(
                      child: FittedBox(
                        child: Material(
                          color: Colors.white,
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(3.0),
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
                                      image: AssetImage('images/app_logo.png'),
                                    ),

                                    //link for doctor /medicine
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    launch('https://sakec.ai/team.html'),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 0.0,
                                      right: 5.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                  onTap: () =>
                      launch('https://www.shahandanchor.com/research/'),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Container(
                      child: FittedBox(
                        child: Material(
                          color: Colors.white,
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(3.0),
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
                                          'images/Research Cell Logo(sm).png'),
                                    ),

                                    //link for doctor /medicine
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => launch(
                                    'https://www.shahandanchor.com/research/'),
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 0.0,
                                      right: 5.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  child: Row(children: <Widget>[
                                    Container(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Research Cell",
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
              ],
            ),
          ),
        ));
  }
}
