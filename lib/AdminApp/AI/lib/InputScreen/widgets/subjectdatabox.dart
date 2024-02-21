import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectDataBox extends StatelessWidget {
  final subject = TextEditingController();
  final teacher = TextEditingController();
  final classroom = TextEditingController();
  final hours = TextEditingController();

  void dispose() {
    subject.dispose();
    teacher.dispose();
    classroom.dispose();
    hours.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 45,
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.book,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                        text: ' Add Theory Subject Details',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],
                ),
              )
//                child: Text(
//                  'Select Working Days',
//                  style: TextStyle(fontSize: 30, color: Colors.white),
//                  textAlign: TextAlign.center,
//                ),
              ),
          TextFormField(
            controller: subject,
            decoration: InputDecoration(
                hintText: 'Subject Name', icon: Icon(Icons.create)),
            onChanged: (value) {},
          ),
          TextFormField(
            controller: teacher,
            decoration: InputDecoration(
              hintText: " Teacher's List (Comma separated)",
              icon: Icon(Icons.business_center),
            ),
            onChanged: (value) {},
          ),
          // TextFormField(
          //   controller: classroom,
          //   decoration: InputDecoration(
          //       hintText: " Classroom's List (Comma separated)",
          //       icon: Icon(Icons.business)),
          //   onChanged: (value) {},
          // ),
          TextFormField(
            controller: hours,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'Enter Total hours per week',
                icon: Icon(Icons.access_time)),
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
