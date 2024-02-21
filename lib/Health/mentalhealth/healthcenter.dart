import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../page_transition.dart';

class HealthCen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomePageState();
  }
}

class HomePage1 extends StatefulWidget {
  @override
  _Page1 createState() => _Page1();
}

class HomePage2 extends StatefulWidget {
  @override
  _Page2 createState() => _Page2();
}

class HomePage3 extends StatefulWidget {
  @override
  _Page3 createState() => _Page3();
}

class HomePage4 extends StatefulWidget {
  @override
  _Page4 createState() => _Page4();
}

class HomePage5 extends StatefulWidget {
  @override
  _Page5 createState() => _Page5();
}

class HomePage6 extends StatefulWidget {
  @override
  _Page6 createState() => _Page6();
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
              // PageTransition(
              //     type: PageTransitionType.rightToLeft,
              //     duration: Duration(milliseconds: 600),
              //     child: Dash()),
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
                "Mental Health Corner",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),
            elevation: 0,
          ),
          body: DefaultTabController(
            length: 6,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 15, bottom: 0),
                  child: ButtonsTabBar(
                    radius: 15.0,
                    backgroundColor: Color(0xFF3b7dfb),
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        text: "Doctors Advice",
                      ),
                      Tab(
                        text: "Experience",
                      ),
                      Tab(
                        text: "Motivation",
                      ),
                      Tab(
                        text: "Yoga",
                      ),
                      Tab(
                        text: "Meditation",
                      ),
                      Tab(
                        text: "Celebrity Talks",
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
                        child: HomePage2(),
                      ),
                      Center(
                        child: HomePage3(),
                      ),
                      Center(
                        child: HomePage4(),
                      ),
                      Center(
                        child: HomePage5(),
                      ),
                      Center(
                        child: HomePage6(),
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
  String videoURL1 = "https://www.youtube.com/watch?v=BDlE4aUT9tw&";
  String videoURL2 = "https://www.youtube.com/watch?v=wohTFdqCurA&";
  String videoURL3 = "https://www.youtube.com/watch?v=D4Z7cQ7jLGc&";
  String videoURL4 = "https://www.youtube.com/watch?v=vWzEao1mXfo&";
  String videoURL5 = "https://www.youtube.com/watch?v=l-Nz8b-4G0Y&";
  String videoURL6 = "https://www.youtube.com/watch?v=wZKKOWtxiLk";
  String videoURL7 = "https://www.youtube.com/watch?v=DEX9hiAwn8I";
  String videoURL8 = "https://www.youtube.com/watch?v=8RGCmpHePnU";

  YoutubePlayerController _controller1;
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;
  YoutubePlayerController _controller4;
  YoutubePlayerController _controller5;
  YoutubePlayerController _controller6;
  YoutubePlayerController _controller7;
  YoutubePlayerController _controller8;
  @override
  void initState() {
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL1),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL2),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller3 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL3),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller4 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL4),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller5 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL5),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller6 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL6),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller7 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL7),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller8 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL8),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          new Container(
              child: new Container(
                  margin: new EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                  ),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller1,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Coronavirus Symptoms & Myths',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr. Rajib Paul',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller2,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Italian doctor on treating COVID-19 patients',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr. Giovanni Guaraldi',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller3,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        '10 Tips for COVID-19 (Coronavirus)',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr Thomas Pulimood',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller4,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'How to treat coronavirus at home | Medications | Homemade Remedies',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Thomina Mirza',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller5,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'How diabetics should take care during coronavirus',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Jothydev Kesavadev MD ',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller6,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'COVID-19 - Home Care explained',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr. Gurava Reddy \n Dr. Kushal Hippalgaonkar',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller7,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'COVID-19 and the pressures of pandemic coverage',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr Norman Swan',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller8,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Coronavirus Infections: More Than Just The Common Cold',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr. Anthony Fauci',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ]));
  }
}

class _Page2 extends State<HomePage2> {
  String videoURL1 = "https://www.youtube.com/watch?v=sFiy4kvRcSs&";
  String videoURL2 = "https://www.youtube.com/watch?v=Eh8BOSu5JVw&";
  String videoURL3 = "https://www.youtube.com/watch?v=syCY6E89VsA";
  String videoURL4 = "https://www.youtube.com/watch?v=L1j1VDCei6k&";
  String videoURL5 = "https://www.youtube.com/watch?v=ph9NZ7hZM9E";
  String videoURL6 = "https://www.youtube.com/watch?v=x2ipw0Mt6g8";

  YoutubePlayerController _controller1;
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;
  YoutubePlayerController _controller4;
  YoutubePlayerController _controller5;
  YoutubePlayerController _controller6;

  @override
  void initState() {
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL1),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL2),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller3 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL3),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller4 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL4),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller5 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL5),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller6 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL6),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller1,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Experience Recovering from COVID-19',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr. Isaac George',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller2,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Story Of COVID-19 Recovery of 21 Year Old Mumbai Boy',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Hrishi Giridhar',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller3,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Couple shares coronavirus recovery story',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
//                            Row(
//                              children: <Widget>[
//                                Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.7,
//                                  child: new Text(
//                                    'Dr. Giovanni Guaraldi',
//                                    style: TextStyle(color: Colors.grey),
//                                  ),
//                                ),
//                              ],
//                            ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller4,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'What You Need To Know: From A Recovered COVID 19 Patient',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Chip Burger & Rickey Bevington',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller5,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'COVID-19 Antibody Test Experience',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        '9Health staff member',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller6,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'COVID-19 Treatment & Recovery at Home',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr. Jack Rodman & Dr. Joseph Seaman',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ]));
  }
}

class _Page3 extends State<HomePage3> {
  String videoURL1 = "https://www.youtube.com/watch?v=pihZ-LQGlqo&";
  String videoURL2 = "https://www.youtube.com/watch?v=vwHlJk2L-qE";
  String videoURL3 = "https://www.youtube.com/watch?v=w-wXhTccZFQ&";
  String videoURL4 = "https://www.youtube.com/watch?v=5oUoAAr0rpE&";
  String videoURL5 = "https://www.youtube.com/watch?v=jQuX6RiFaTQ";
  String videoURL6 = "https://www.youtube.com/watch?v=b6rplRIlWHA";
  String videoURL7 = "https://www.youtube.com/watch?v=pFFXvZAQupQ";

  YoutubePlayerController _controller1;
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;
  YoutubePlayerController _controller4;
  YoutubePlayerController _controller5;
  YoutubePlayerController _controller6;
  YoutubePlayerController _controller7;
  @override
  void initState() {
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL1),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL2),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller3 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL3),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller4 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL4),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller5 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL5),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller6 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL6),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller7 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL7),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller1,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        '"HUMANITY vs. COVID-19" Motivation during the Coronavirus ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Jeremy Anderson',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller2,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'A Calming Word During the Coronavirus',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Joni Eareckson Tada',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller3,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Working From Home? 5 Tips to Boost Productivity in the Coronavirus Pandemic',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Rebecca Greenfield',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller4,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Mental Health in the Coronavirus Pandemic | COVID-19',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Aileen Xu',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller5,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'How to stay motivated during Covid-19 lock down',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
//                            Row(
//                              children: <Widget>[
//                                Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.7,
//                                  child: new Text(
//                                    'Dr. Giovanni Guaraldi',
//                                    style: TextStyle(color: Colors.grey),
//                                  ),
//                                ),
//                              ],
//                            ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller6,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Instilling Motivation During COVID-19',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Rachel Helfand',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller7,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Supporting the mental health of children during COVID-19',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr. Mandy Bryon',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ]));
  }
}

class _Page4 extends State<HomePage4> {
  String videoURL1 = "https://www.youtube.com/watch?v=tsirEJLlk10";
  String videoURL2 = "https://www.youtube.com/watch?v=quTno_ZUw20&";
  String videoURL3 = "https://www.youtube.com/watch?v=p9F0fQK81Pw&";
  String videoURL4 = "https://www.youtube.com/watch?v=JbKfuXo2q6s&";
  String videoURL5 = "https://www.youtube.com/watch?v=CEq57wzv4cY";
  String videoURL6 = "https://www.youtube.com/watch?v=HLEQOG12PzQ";

  YoutubePlayerController _controller1;
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;
  YoutubePlayerController _controller4;
  YoutubePlayerController _controller5;
  YoutubePlayerController _controller6;

  @override
  void initState() {
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL1),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL2),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller3 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL3),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller4 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL4),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller5 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL5),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller6 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL6),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller1,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Simple yoga for a better life during COVID-19',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Angela Gallagher',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller2,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'COVID-19 prevention: 6 yoga poses to strengthen your immune system',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Nerry Toledo',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller3,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Wellness during COVID-19: Basic breathing techniques',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Jennifer Taylor',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller4,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Exercises to Boost IMMUNE SYSTEM | 10 Minute Daily Routines',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
//                            Row(
//                              children: <Widget>[
//                                Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.7,
//                                  child: new Text(
//                                    'Rachel Helfand',
//                                    style: TextStyle(color: Colors.grey),
//                                  ),
//                                ),
//                              ],
//                            ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller5,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        "ITBP Organises Yoga Session At Delhi's Sardar Patel COVID Care Centre",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
//                            Row(
//                              children: <Widget>[
//                                Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.7,
//                                  child: new Text(
//                                    'Rachel Helfand',
//                                    style: TextStyle(color: Colors.grey),
//                                  ),
//                                ),
//                              ],
//                            ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller6,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Yoga Practice During the COVID-19 Crisis',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Darren Main',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ]));
  }
}

class _Page5 extends State<HomePage5> {
  String videoURL1 = "https://www.youtube.com/watch?v=T0Tv7FuvNJ8";
  String videoURL2 = "https://www.youtube.com/watch?v=W19PdslW7iw";
  String videoURL3 = "https://www.youtube.com/watch?v=b0BHLvtSFz4&";
  String videoURL4 = "https://www.youtube.com/watch?v=GoRjUCWd-fM";
  String videoURL5 = "https://www.youtube.com/watch?v=mqs62J5UyY0";

  YoutubePlayerController _controller1;
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;
  YoutubePlayerController _controller4;
  YoutubePlayerController _controller5;

  @override
  void initState() {
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL1),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL2),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller3 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL3),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller4 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL4),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller5 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL5),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller1,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Mindfulness & Meditation - COVID-19 - Meditation Example',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Kristin Lothman',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller2,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        '15 Minute Guided Meditation To Find Peace In Uncertain Times',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Juliana Spicoluk',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller3,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Meditation to boost immunity, release stress & tame anxiety during coronavirus pandemic',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Dr. Andrea Pennington',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller4,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Meditation for Coronavirus Anxiety | 5 Minutes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Jeremy Lipkowitz',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller5,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Meditation for Peace- Lower Anxiety + Fear - Light and Safety during Coronavirus- 15 minutes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Cassandra Kubinski',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ]));
  }
}

class _Page6 extends State<HomePage6> {
  String videoURL1 = "https://www.youtube.com/watch?v=mVxud8lvxes";
  String videoURL2 = "https://www.youtube.com/watch?v=Op83k-jzJLk&";
  String videoURL3 = "https://www.youtube.com/watch?v=4bAkgK5C1go";
  String videoURL4 = "https://www.youtube.com/watch?v=z6-odi5FtW0";
  String videoURL5 = "https://www.youtube.com/watch?v=RC7ma4a5LaQ";

  YoutubePlayerController _controller1;
  YoutubePlayerController _controller2;
  YoutubePlayerController _controller3;
  YoutubePlayerController _controller4;
  YoutubePlayerController _controller5;

  @override
  void initState() {
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL1),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL2),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller3 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL3),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller4 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL4),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    _controller5 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL5),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          isLive: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller1,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Aamir Khan, Indian Bollywood megastar sends message of encouragement to coronavirus hit China',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Aamir Khan',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller2,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Bollywood Together Against CORONA Virus',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Salman, Priyanka, Preity, Sachin, Hina And Others',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller3,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        "Bollywood Actors' take on Covid 19",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Amitabh Bachchan, Hema Malini, Anupam Kher, Salman Khan, Akshay Kumar',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller4,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Matthew McConaughey shares message of hope amid coronavirus pandemic',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Matthew McConaughey',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          new Container(
              child: new Container(
                  margin:
                      new EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                  decoration: new BoxDecoration(color: Colors.white),
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3,
                          child: new Container(
                            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: new Column(
                              children: <Widget>[
                                YoutubePlayer(
                                  controller: _controller5,
                                  //  showVideoProgressIndicator: true,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Justin Bieber, Katy Perry & Joe Giudice React to Coronavirus',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: new Text(
                                        'Justin Bieber, Katy Perry & Joe Giudice',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ], //
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ]));
  }
}
