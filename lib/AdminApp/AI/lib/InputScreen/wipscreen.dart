import 'package:flutter/material.dart';

class WorkInProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Table", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.settings, size: 75,),
                Icon(Icons.settings, size: 35,)
              ],
            ),
            SizedBox(height: 10,),
            Text("Work In Progress", style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
