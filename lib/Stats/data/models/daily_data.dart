import 'package:flutter/cupertino.dart';

class DailyData {
  String _date;

  int _totalConfirmed;
  int _totalDeaths;
  int _totalRecovered;
  int _totalActive;

  DailyData({
    @required date,

    @required totalConfirmed,
    @required totalDeaths,
    @required totalRecovered,
  }) {
    this._date = date;

    this._totalConfirmed = totalConfirmed;
    this._totalDeaths = totalDeaths;
    this._totalRecovered = totalRecovered;
    this._totalActive = totalConfirmed - totalRecovered - totalDeaths;

  }

  factory DailyData.fromJson(Map<String, dynamic> json) {
    return DailyData(
      date: json["date"],

      totalConfirmed: int.tryParse(json["totalconfirmed"]) ?? 0,
      totalDeaths: int.tryParse(json["totaldeceased"]) ?? 0,
      totalRecovered: int.tryParse(json["totalrecovered"]) ?? 0,
    );
  }

  set date(String date) => this._date = date;

  set totalConfirmed(int totalConfirmed) => this._totalConfirmed = totalConfirmed;
  set totalDeaths(int totalDeaths) => this._totalDeaths = totalDeaths;
  set totalRecovered(int totalRecovered) => this._totalRecovered = totalRecovered;

  String get date => this._date;

  int get totalConfirmed => this._totalConfirmed;
  int get totalDeaths => this._totalDeaths;
  int get totalRecovered => this._totalRecovered;
  int get totalActive => this._totalActive;

}
