import 'package:flutter/material.dart';
import 'constants.dart';

class StaticTableCell extends StatelessWidget {
  final Color color;
  final String text;
  final int days;

  StaticTableCell({@required this.color, @required this.text, @required this.days});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: width / days,
      height: height / 20,
      alignment: Alignment.center,
      color: color,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: height / 40),
      ),
    );
  }
}