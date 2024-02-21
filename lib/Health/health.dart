import 'package:sakecblue/Login/auth.dart';
import 'package:sakecblue/Health/mentalhealth/healthcenter.dart';
import 'package:sakecblue/Login/provider.dart';
import 'package:flutter/material.dart';
import 'package:sakecblue/Health/seekhelp/doctor.dart';
import 'package:sakecblue/Health/plasmadonation/plasmamain.dart';

class Health extends StatefulWidget {
  @override
  _Health createState() => _Health();
}

class _Health extends State<Health> {
  // ignore: non_constant_identifier_names
  List<Widget> Containers = [
    Container(
      child: HealthCen(),
    ),
    Container(
      child: Doc(),
    ),
    Container(
      child: Plasma(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            "Health Corner",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35.0,
              fontFamily: 'Bebas',
            ),
          ),
          elevation: 0,
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: 'Bebas',
                ),
              ),
              onPressed: () async {
                try {
                  Auth auth = Provider.of(context).auth;
                  await auth.signOut();
                } catch (e) {
                  print(e);
                }
              },
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Videos',
              ),
              Tab(
                text: 'Doctor Help',
              ),
              Tab(
                text: 'Plasma Donate',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: Containers,
        ),
      ),
    );
  }
}
