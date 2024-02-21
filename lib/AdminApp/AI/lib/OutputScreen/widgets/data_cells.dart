import 'package:flutter/material.dart';

class TableDataCell extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPress;
  final int cellNumber;
  final int days;

  TableDataCell({this.cellNumber, @required this.color, @required this.text, @required this.onPress, @required this.days});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width / days,
        height: height / 20,
        alignment: Alignment.center,
        color: color,
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: height / 50),
        ),
      ),
    );
  }
}