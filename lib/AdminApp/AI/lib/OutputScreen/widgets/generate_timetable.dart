// To parse this JSON data, do
//
//     final generatedTimeTable = generatedTimeTableFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GeneratedTimeTable generatedTimeTableFromJson(String str) => GeneratedTimeTable.fromJson(json.decode(str));

String generatedTimeTableToJson(GeneratedTimeTable data) => json.encode(data.toJson());

class GeneratedTimeTable {
  GeneratedTimeTable({
    @required this.days,
    @required this.timeTable,
    @required this.timeslots,
  });

  final List<String> days;
  final Map<String, List<List<List<String>>>> timeTable;
  final List<String> timeslots;

  factory GeneratedTimeTable.fromJson(Map<String, dynamic> json) => GeneratedTimeTable(
    days: List<String>.from(json["Days"].map((x) => x)),
    timeTable: Map.from(json["TimeTable"]).map((k, v) => MapEntry<String, List<List<List<String>>>>(k, List<List<List<String>>>.from(v.map((x) => List<List<String>>.from(x.map((x) => List<String>.from(x.map((x) => x)))))))),
    timeslots: List<String>.from(json["Timeslots"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Days": List<dynamic>.from(days.map((x) => x)),
    "TimeTable": Map.from(timeTable).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => List<dynamic>.from(x.map((x) => List<dynamic>.from(x.map((x) => x)))))))),
    "Timeslots": List<dynamic>.from(timeslots.map((x) => x)),
  };
}
