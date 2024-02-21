import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:http/http.dart' as http;
import 'package:sakecblue/Stats/ui/pages/homepage.dart';
import 'dart:math' as math;

//void graph() => runApp(new MaterialApp(
//  home: new HomePage(),
//));

class Graphone extends StatefulWidget {
  @override
  GraphState createState() => GraphState();
}

class GraphState extends State<Graphone> {
  final String url = "https://api.covid19india.org/data.json";

  List data;
  List dataTwo;
  var indexTwo = 0;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['cases_time_series'];
      dataTwo = convertDataToJson['statewise'];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(3.0),
      elevation: 0.0,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      },
      color: Colors.white,
      child: new ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: data == null ? 0 : 1,
        reverse: false,
        itemBuilder: (BuildContext context, int index) {
          index = data.length - 1;
          return new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Confirmed',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '+' + dataTwo[indexTwo]['deltaconfirmed'],
                    style: TextStyle(color: Colors.blueAccent, fontSize: 10.0),
                  ),
                  Text(
                    dataTwo[indexTwo]['confirmed'],
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new Container(
                      width: 50.0,
                      height: 30.0,
                      child: new Sparkline(
                        data: [
//                          double.parse(data[index - 9]["dailyconfirmed"]),
//                          double.parse(data[index - 8]["dailyconfirmed"]),
                          double.parse(data[index - 7]["dailyconfirmed"]),
                          double.parse(data[index - 6]["dailyconfirmed"]),
                          double.parse(data[index - 5]["dailyconfirmed"]),
                          double.parse(data[index - 4]["dailyconfirmed"]),
                          double.parse(data[index - 3]["dailyconfirmed"]),
                          double.parse(data[index - 2]["dailyconfirmed"]),
                          double.parse(data[index - 1]["dailyconfirmed"]),
                          double.parse(data[index]["dailyconfirmed"])
                        ],
                        pointsMode: PointsMode.last,
                        pointSize: 6.0,
                        pointColor: Colors.blue,
                        lineWidth: 1.5,
                        lineColor: Colors.blueAccent,
//                        fillMode: FillMode.below,
//                        fillColor: Colors.black12,
                      ),
                      padding: const EdgeInsets.all(1.0)),
                ],
              ),
//                SizedBox(width: 10.0),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Active',
                      style: TextStyle(
                          color: Colors.amberAccent[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0)),
                  SizedBox(
                    height: 25.0,
                  ),
//                  Text(
//                    '+' + dataTwo[indexTwo]['deltaconfirmed'],
//                    style: TextStyle(color: Colors.blueAccent, fontSize: 10.0),
//                  ),
                  Text(
                    dataTwo[indexTwo]['active'],
                    style: TextStyle(
                        color: Colors.amberAccent[700], fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new Container(
                      width: 50.0,
                      height: 30.0,
                      child: new Sparkline(
                        data: [
//                          double.parse(data[index - 9]["dailyconfirmed"]),
//                          double.parse(data[index - 8]["dailyconfirmed"]),
                          double.parse(data[index - 7]["totalconfirmed"]) -
                              double.parse(data[index - 7]["totalrecovered"]) -
                              double.parse(data[index - 7]["totaldeceased"]),
                          double.parse(data[index - 6]["totalconfirmed"]) -
                              double.parse(data[index - 6]["totalrecovered"]) -
                              double.parse(data[index - 6]["totaldeceased"]),
                          double.parse(data[index - 5]["totalconfirmed"]) -
                              double.parse(data[index - 5]["totalrecovered"]) -
                              double.parse(data[index - 5]["totaldeceased"]),
                          double.parse(data[index - 4]["totalconfirmed"]) -
                              double.parse(data[index - 4]["totalrecovered"]) -
                              double.parse(data[index - 4]["totaldeceased"]),
                          double.parse(data[index - 3]["totalconfirmed"]) -
                              double.parse(data[index - 3]["totalrecovered"]) -
                              double.parse(data[index - 3]["totaldeceased"]),
                          double.parse(data[index - 2]["totalconfirmed"]) -
                              double.parse(data[index - 2]["totalrecovered"]) -
                              double.parse(data[index - 2]["totaldeceased"]),
                          double.parse(data[index - 1]["totalconfirmed"]) -
                              double.parse(data[index - 1]["totalrecovered"]) -
                              double.parse(data[index - 1]["totaldeceased"]),
                          double.parse(data[index]["totalconfirmed"]) -
                              double.parse(data[index]["totalrecovered"]) -
                              double.parse(data[index]["totaldeceased"]),
                        ],
                        pointsMode: PointsMode.last,
                        pointSize: 6.0,
                        pointColor: Colors.amberAccent[700],
                        lineWidth: 1.5,
                        lineColor: Colors.amberAccent[700],
//                        fillMode: FillMode.below,
//                        fillColor: Colors.black12,
                      ),
                      padding: const EdgeInsets.all(1.0)),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Recovered',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '+' + dataTwo[indexTwo]['deltarecovered'],
                    style: TextStyle(color: Colors.green, fontSize: 10.0),
                  ),
                  Text(
                    dataTwo[indexTwo]['recovered'],
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new Container(
                      width: 50.0,
                      height: 30.0,
                      child: new Sparkline(
                        data: [
                          double.parse(data[index - 7]["dailyrecovered"]),
                          double.parse(data[index - 6]["dailyrecovered"]),
                          double.parse(data[index - 5]["dailyrecovered"]),
                          double.parse(data[index - 4]["dailyrecovered"]),
                          double.parse(data[index - 3]["dailyrecovered"]),
                          double.parse(data[index - 2]["dailyrecovered"]),
                          double.parse(data[index - 1]["dailyrecovered"]),
                          double.parse(data[index]["dailyrecovered"])
                        ],
                        pointsMode: PointsMode.last,
                        pointSize: 6.0,
                        pointColor: Colors.green,
                        lineWidth: 1.5,
                        lineColor: Colors.green,
//                        fillMode: FillMode.below,
//                        fillColor: Colors.black12,
                      ),
                      padding: const EdgeInsets.all(1.0)),
                ],
              ),
//              SizedBox(width: 7.0),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Deaths',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '+' + dataTwo[indexTwo]['deltadeaths'],
                    style: TextStyle(color: Colors.red, fontSize: 10.0),
                  ),
                  Text(
                    dataTwo[indexTwo]['deaths'],
                    style: TextStyle(color: Colors.red, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new Container(
                      width: 50.0,
                      height: 30.0,
                      child: new Sparkline(
                        data: [
                          double.parse(data[index - 7]["dailydeceased"]),
                          double.parse(data[index - 6]["dailydeceased"]),
                          double.parse(data[index - 5]["dailydeceased"]),
                          double.parse(data[index - 4]["dailydeceased"]),
                          double.parse(data[index - 3]["dailydeceased"]),
                          double.parse(data[index - 2]["dailydeceased"]),
                          double.parse(data[index - 1]["dailydeceased"]),
                          double.parse(data[index]["dailydeceased"])
                        ],
                        pointsMode: PointsMode.last,
                        pointSize: 6.0,
                        pointColor: Colors.red,
                        lineWidth: 1.5,
                        lineColor: Colors.red,
//                        fillMode: FillMode.below,
//                        fillColor: Colors.black12,
                      ),
                      padding: const EdgeInsets.all(1.0)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 100, right: 5),
                        child: Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
