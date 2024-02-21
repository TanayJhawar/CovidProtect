import 'package:flutter/material.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Health/health.dart';
import 'package:sakecblue/Profile/About.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigatoBar(),
    );
  }
}

class MyBottomNavigatoBar extends StatefulWidget{
  @override
  _MyBottomNavigatoBar createState() => _MyBottomNavigatoBar();
}

class _MyBottomNavigatoBar extends State<MyBottomNavigatoBar>{
  int _currentIndex=0;
  final List<Widget>_children=[
    Dash(),
    Health(),
    Profile(),
  ];
  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex = index ; 
    });
  }
  @override
  Widget build(BuildContext context){
  return new Scaffold(
    body: _children[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
    onTap: onTappedBar,
    currentIndex: _currentIndex,
    items: 
  <BottomNavigationBarItem>[
     BottomNavigationBarItem
      (
        icon: Icon(Icons.home),
        title: Text('Home')
      ),
      BottomNavigationBarItem
      (
        icon: Icon(Icons.local_hospital),
        title: Text('Health')
      ),
      BottomNavigationBarItem
      (
        icon: Icon(Icons.contacts),
        title: Text('About Us')
      ),
     ],
    )
  );
  }
}