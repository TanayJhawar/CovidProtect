import 'package:sakecblue/Login/login.dart';
import 'package:flutter/material.dart';

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeCountryPageState createState() => _ChangeCountryPageState();
}

class _ChangeCountryPageState extends State<ChangeLanguagePage> {
  List<String> languages = [
    'Hindi',
    'Bengali',
    'English',
    'Marathi',
    'Gujrati',
    'Tamil',
  ];

  String currentLanguage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Language A / का',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
              ),
              Flexible(
                child: ListView(
                  children: languages
                      .map((l) => ListTile(
                            onTap: () {
                              setState(() {
                                currentLanguage = l;
                              });
                            },
                            title: Text(
                              l,
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: l == currentLanguage
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.blueAccent,
                                    size: 16,
                                  )
                                : SizedBox(),
                          ))
                      .toList(),
                ),
              ),
              Align(
                alignment:Alignment.bottomCenter,
                child:RaisedButton(
                  child: Text('Continue'),
                  color: Colors.blueAccent,
                  onPressed: () { 
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Log()
                  )
                  );
                 },)
              )
            ],
          ),
        ),
      ),
    );
  }
}
