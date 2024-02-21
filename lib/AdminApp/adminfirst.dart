import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import '../page_transition.dart';
import 'adminrequest.dart';


class AdminFirst extends StatefulWidget {
  @override
  _AdminFirstState createState() => _AdminFirstState();
}

class _AdminFirstState extends State<AdminFirst> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminReq()),
              );
            },
            child: Icon(Icons.arrow_forward),
          ),
          backgroundColor: Colors.white,
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
        ));
  }
}

class Baselayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Welcome to the\nadmin panel of\n'CovidProtect'",
                  style: TextStyle(
                      fontFamily: "Bebas", fontSize: 48, color: Colors.black),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: splay_image(),
            ),
          ],
        ));
  }
}

class splay_image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('images/admin/admin_splay.png'));
  }
}
