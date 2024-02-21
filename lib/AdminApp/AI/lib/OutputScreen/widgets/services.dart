import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'generate_timetable.dart';
import 'input1.dart';
import 'dart:convert';
import 'dart:async';

class Services {
  static const String url = 'http://10.0.2.2:5000/timetable';

  static Future<GeneratedTimeTable> getTimeTable() async {
    final String body = json.encode(inputData);
//    print(body);
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: body);
//      print(response.body);         // Returned json successfully
    GeneratedTimeTable timetable = generatedTimeTableFromJson(response.body);
//    print(timetable.timeTable[0]);
    return timetable;
  }
}
