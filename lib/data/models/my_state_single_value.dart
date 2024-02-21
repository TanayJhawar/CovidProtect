import 'package:sakecblue/misc/helper.dart';
import 'package:flutter/cupertino.dart';

class MyStateSingleValue {
  Map<String, String> stateNamesMap = {
    "alberta":"alberta",
  "british-columbia" :"british columbia",
  "diamond-princess":"diamond princess","grand-princess":"grand princess",
  "manitoba":"manitoba",
  "new-brunswick":"new-brunswick",
  "newfoundland-and-labrador":"newfoundland and labrador","northwest-territories":"northwest territories",
  "nova-scotia":"nova scotia","ontario":"ontario","prince-edward-island": "prince edward island","quebec":"quebec","saskatchewan":"saskatchewan","yukon":"yukon",
  };

  String _stateCode;
  String _status;
  String _stateName;
  int _value;
  String _dateString;
  DateTime _date;

  MyStateSingleValue({@required String stateCode, @required String status, @required int value, @required String dateString}) {
    this._stateCode = stateNamesMap[stateCode];
    this._stateName = stateCode;
    this._status = status;
    this._value = value != null ? value : 0;
    this._dateString = dateString;
    this._date = Helper.parseDateTimeDDMMMYY(dateString);
  }

  set stateCode(String stateCode) => this._stateCode = stateNamesMap[stateCode.toUpperCase()];
  set status(String status) => this._status = status;
  set statename(String stateCode) => this._stateName = stateCode;
  set value(int value) => this._value = value;
  set dateString(String dateString) => this._dateString = dateString;
  set date(DateTime date) => this._date = date;

  String get stateCode => this._stateCode;
  String get stateName => this._stateName;
  String get status => this._status;
  int get value => this._value;
  String get dateString => this._dateString;
  DateTime get date => this._date;

  bool equals({String stateCode}) {
    if (stateCode.toUpperCase() == this._stateCode || stateCode.toLowerCase() == this._stateCode) return true;
    return false;
  }

  bool dateEquals(String dateString) {
    return this._dateString == dateString;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "   { stateCode : $stateCode, status : $status, value : $value, dateString : $dateString, date : ${date.toString()}} ";
  }
}
