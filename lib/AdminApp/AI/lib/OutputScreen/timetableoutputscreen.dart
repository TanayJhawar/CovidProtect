import 'package:flutter/material.dart';
import 'widgets/generate_timetable.dart';
import 'widgets/timetable.dart';
import 'package:flutter/foundation.dart';
import 'widgets/services.dart';

class TimeTableOutputScreen extends StatefulWidget {
  TimeTableOutputScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimeTableOutputScreenState createState() => _TimeTableOutputScreenState();
}

class _TimeTableOutputScreenState extends State<TimeTableOutputScreen> {
//  GeneratedTimeTable result;
  GeneratedTimeTable _timetable;

  void getData() async {
    GeneratedTimeTable t = await Services.getTimeTable();
    setState(() {
      _timetable = t;
    });
  }

  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    print(_result);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _timetable == null
          ? Center(
              child: Text('Loading...'),
            )
          : ListView(
              children: <Widget>[
                TimeTableDisplay(
                  timetable: _timetable.timeTable['0'],
                  days: _timetable.days,
                  timeSlots: _timetable.timeslots,
                  sectionNumber: '0',
                ),
                TimeTableDisplay(
                  timetable: _timetable.timeTable['1'],
                  days: _timetable.days,
                  timeSlots: _timetable.timeslots,
                  sectionNumber: '1',
                ),
                TimeTableDisplay(
                  timetable: _timetable.timeTable['2'],
                  days: _timetable.days,
                  timeSlots: _timetable.timeslots,
                  sectionNumber: '2',
                ),
              ],
            ),
    );
  }
}
