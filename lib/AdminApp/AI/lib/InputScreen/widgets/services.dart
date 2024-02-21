// To parse this JSON data, do
//
//     final inputTimeTable = inputTimeTableFromJson(jsonString);

import 'package:http/http.dart' as http;
import '../../OutputScreen/widgets/generate_timetable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'dart:async';

class Services {
  static const String url = 'http://10.0.2.2:5000/timetable';

  static Future<GeneratedTimeTable> getTimeTable() async {
    final String body = json.encode('');
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

//InputTimeTable inputTimeTableFromJson(String str) => InputTimeTable.fromJson(json.decode(str));

String inputTimeTableToJson(InputTimeTable data) => json.encode(data.toJson());

class InputTimeTable {
  InputTimeTable({
    @required this.sections,
    @required this.days,
    @required this.timeslots,
    @required this.subjects,
  });

  final int sections;
  final List<String> days;
  final List<String> timeslots;
  final List<Subject> subjects;

  factory InputTimeTable.fromJson(Map<String, dynamic> json) => InputTimeTable(
    sections: json["SECTIONS"],
    days: List<String>.from(json["DAYS"].map((x) => x)),
    timeslots: List<String>.from(json["TIMESLOTS"].map((x) => x)),
    subjects: List<Subject>.from(json["SUBJECTS"].map((x) => Subject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "SECTIONS": sections,
    "DAYS": List<dynamic>.from(days.map((x) => x)),
    "TIMESLOTS": List<dynamic>.from(timeslots.map((x) => x)),
    "SUBJECTS": List<dynamic>.from(subjects.map((x) => x.toJson())),
  };
}

class Subject {
  Subject({
    @required this.subjectName,
    @required this.teachers,
    @required this.classrooms,
    @required this.hours,
  });

  final String subjectName;
  final List<String> teachers;
  final List<String> classrooms;
  final int hours;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    subjectName: json["SUBJECT_NAME"],
    teachers: List<String>.from(json["TEACHERS"].map((x) => x)),
    classrooms: List<String>.from(json["CLASSROOMS"].map((x) => x)),
    hours: json["HOURS"],
  );

  Map<String, dynamic> toJson() => {
    "SUBJECT_NAME": subjectName,
    "TEACHERS": List<dynamic>.from(teachers.map((x) => x)),
    "CLASSROOMS": List<dynamic>.from(classrooms.map((x) => x)),
    "HOURS": hours,
  };
}

