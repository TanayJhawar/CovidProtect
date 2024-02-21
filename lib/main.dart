import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Tilldash/first.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.clear();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      Locale('en', 'US'),
      Locale('hi', 'IN'),
    ],
    path: 'assets/lang',
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loggedin = false;

  _getIfLoggedIn() async {
    bool isloggedin;
    final prefs = await SharedPreferences.getInstance();
    isloggedin = prefs.getBool('isLoggedIn') ?? false;
    if (isloggedin == null) {
      setState(() {
        loggedin = false;
      });
    } else {
      setState(() {
        loggedin = isloggedin;
      });
    }
  }

  Widget show() {
    if (loggedin) {
      return Dash();
    } else {
      return Splayimage();
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _getIfLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PaintingBinding.instance.imageCache.clear();
    return MaterialApp(
      title: 'SAKECBlue',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: show(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
