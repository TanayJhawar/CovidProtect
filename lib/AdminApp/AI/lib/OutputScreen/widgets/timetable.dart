import 'package:flutter/material.dart';
import 'static_table_cell.dart';
import 'data_cells.dart';
import 'constants.dart';

// (j-1)*10 + i+j - 1 + (j-1 <=0 ? 0 : j-1)

class TimeTableDisplay extends StatefulWidget {
  final List<List<List<String>>> timetable;
  final List<String> days;
  final List<String> timeSlots;
  final String sectionNumber;
//  final String timetable;
  TimeTableDisplay({@required this.timetable, @required this.days, @required this.timeSlots, @required this.sectionNumber});

  @override
  _TimeTableDisplayState createState() => _TimeTableDisplayState();
}

class _TimeTableDisplayState extends State<TimeTableDisplay> {
  @override
  Widget build(BuildContext context) {

    int _days = widget.days.length;
    int _hours = widget.timeSlots.length;

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            for (var day_ in widget.days)
              StaticTableCell(
                text: day_,
                color: DAY_COLOR[widget.days.indexOf(day_) % 2],
                days: _days,
              ),
          ],
        ),
        for (int i = 0; i < _hours; i++)
          Row(
            children: <Widget>[
              for (int j = 0; j < _days; j++)
                j == 0
                    ? StaticTableCell(
                        text: widget.timeSlots[i],
                        color: DAY_COLOR[(i + 1) % 2],
                        days: _days,
                      )
                    : TableDataCell(
                        color: SUBJECT_COLOR[((i + j) % 2)],
                        text: widget.timetable[j-1][i][0],
                        onPress: () {
                          print('Tappy');
                        },
                days: _days,),
//                  StaticTableCell(
//                    text: SUBJECTS.indexOf(sub_) == 0
//                    ? TIME[i]
//                    : sub_,
//                    color: SUBJECTS.indexOf(sub_) == 0
//                        ? DAY_COLOR[(i + 1) % 2]
//                        : SUBJECT_COLOR[(SUBJECTS.indexOf(sub_)) % 2],
//                  )
            ],
          ),
        Container(
          height: MediaQuery.of(context).size.height / 20,
          color: Colors.black12,
          alignment: Alignment.center,
          child: Text(
            'Section ' + widget.sectionNumber,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 40,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
