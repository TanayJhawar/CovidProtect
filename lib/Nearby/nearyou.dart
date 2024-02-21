import 'dart:convert';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Nearby/dropdown_city.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'map.dart';
import '../page_transition.dart';
import 'selecting_resources.dart';

class Resources extends StatefulWidget {
  final String city;
  final String category;

  Resources({Key key, this.title, this.city, this.category}) : super(key: key);

  final String title;
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  final String url = "https://api.covid19india.org/resources/resources.json";

  List data;
  List<Map> filteredList;

  @override
  void initState() {
    this.theRequest();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.city);
    debugPrint(widget.category);

    void _toSelectresources() {
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 600),
            child: SelectResources(
              city: widget.city,
            )),
      );
    }

    return WillPopScope(
        onWillPop: () {
          _toSelectresources();
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 600),
                      child: SelectResources(
                        city: widget.city,
                      )),
                ),
              ),
              backgroundColor: Colors.white,
              iconTheme: new IconThemeData(color: Colors.black),
              title: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Resources near ${widget.title}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              elevation: 0,
            ),
            body: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: filteredList == null ? 0 : filteredList.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  color: Colors.white,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            shadowColor: Colors.grey,
                            elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: FittedBox(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "${filteredList[index]["nameoftheorganisation"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ), //
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1),
                                  child: Row(
                                    children: <Widget>[],
                                  ), //
                                ),

                                Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "${widget.city}, ${filteredList[index]["state"]}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                // Padding(
                                //     padding: EdgeInsets.only(bottom: 1.0),
                                //     child: Row(
                                //       children: <Widget>[
                                //         Padding(
                                //           padding: EdgeInsets.only(left: 10.0,bottom:8, right: 10.0),
                                //           child: Text(
                                //             "${widget.city}, ${filteredList[index]["state"]}",
                                //             style: TextStyle(
                                //               fontSize: 14.0,
                                //               fontWeight: FontWeight.bold

                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1),
                                  child: Row(
                                    children: <Widget>[],
                                  ), //
                                ),

                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "${filteredList[index]["descriptionandorserviceprovided"]}",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey[600]),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(bottom: 1),
                                  child: Row(
                                    children: <Widget>[],
                                  ), //
                                ),

                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "${filteredList[index]["category"]}",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    children: <Widget>[],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.web_asset,
                                          color: Colors.blue,
                                          size: 20.0,
                                        ),
                                        FlatButton(
                                          child: new Text(
                                            "  Click here to Visit Website",
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          onPressed: () {
                                            if (filteredList[index]
                                                    ["contact"] !=
                                                null) {
                                              launch(
                                                  "${filteredList[index]["contact"]}");
                                            } else {
                                              _dialog();
                                            }
                                          },
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, bottom: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.phone,
                                        color: Colors.blue,
                                        size: 20.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: new FlatButton(
                                          onPressed: () => launch(
                                              "tel:${filteredList[index]["phonenumber"]}"),
                                          child: Text(
                                            "${filteredList[index]["phonenumber"]}",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.blue,
                                        size: 20.0,
                                      ),
                                      FlatButton(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          "Get Location",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        onPressed: () =>
                                            MapsLauncher.launchQuery(
                                          "${filteredList[index]["nameoftheorganisation"]},${filteredList[index]["city"]}",
                                        ),
                                      ),
                                    ],
                                  ), //
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )));
  }

  Future<String> theRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});

    setState(() {
      var getRequestedData = jsonDecode(response.body);
      data = getRequestedData['resources'];

      filteredList = List();
      var item;
      for (item in data) {
        if ((item['city'] == widget.city) &&
            (item['category'] == widget.category)) {
          filteredList.add(item);
        }
      }
    });
    print(filteredList);
    print(filteredList.length);
    _showDialog();
    return "success";
  }

  void _dialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Text("This resource has No website"),
          );
        });
  }

  void _showDialog() {
    if (filteredList.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Sorry :("),
              content: new Text(
                  "Currently no resource data is available for this location"),
              actions: <Widget>[
                FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectResources(
                                  city: widget.city,
                                )));
                  },
                ),
              ],
            );
          });
    }
  }
}
