import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sakecblue/Dashboard/dashboard.dart';
import '../page_transition.dart';
import 'nearyou.dart';
import 'dropdown_city.dart';

class SelectResources extends StatefulWidget {
  final String city;

  SelectResources({this.city});

  @override
  State<StatefulWidget> createState() {
    return _SelectResourcesState();
  }
}

class _SelectResourcesState extends State<SelectResources> {
  final String url = "https://api.covid19india.org/resources/resources.json";

  List data;
  List<Map> filteredList;

  @override
  void initState() {
    this.theRequest();
  }

  String category = "";
  List<String> entries = <String>[
    'Accommodation and Shelter Homes',
    'Ambulance',
    'CoVID-19 Testing Lab',
    'Community Kitchen',
    'Delivery [Vegetables, Fruits, Groceries, Medicines, etc.]',
    'Fever Clinic',
    'Fire Brigade',
    'Free Food',
    'Fundraisers',
    'Government Helpline',
    'Helpline for Cyclone Amphan',
    'Hospitals and Centers',
    'Mental well being and Emotional Support',
    'Other',
    'Police',
    'Quarantine Facility',
    'Senior Citizen Support',
    'Transportation'
  ];

  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisible5 = false;
  bool isVisible6 = false;
  bool isVisible7 = false;
  bool isVisible8 = false;
  bool isVisible9 = false;
  bool isVisible10 = false;
  bool isVisible11 = false;
  bool isVisible12 = false;
  bool isVisible13 = false;
  bool isVisible14 = false;
  bool isVisible15 = false;
  bool isVisible16 = false;
  bool isVisible17 = false;
  bool isVisible18 = false;
  // ignore: missing_return
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
            (item['category'] == 'Accommodation and Shelter Homes')) {
          setState(() {
            isVisible1 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Ambulance')) {
          setState(() {
            isVisible2 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'CoVID-19 Testing Lab')) {
          setState(() {
            isVisible3 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Community Kitchen')) {
          setState(() {
            isVisible4 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] ==
                'Delivery [Vegetables, Fruits, Groceries, Medicines, etc.]')) {
          setState(() {
            isVisible5 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Fever Clinic')) {
          setState(() {
            isVisible6 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Fire Brigade')) {
          setState(() {
            isVisible7 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Free Food')) {
          setState(() {
            isVisible8 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Fundraisers')) {
          setState(() {
            isVisible9 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Government Helpline')) {
          setState(() {
            isVisible10 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Helpline for Cyclone Amphan')) {
          setState(() {
            isVisible11 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Hospitals and Centers')) {
          setState(() {
            isVisible12 = true;
          });
        }
        if ((item['city'] == widget.city) &&
            (item['category'] == 'Mental well being and Emotional Support')) {
          setState(() {
            isVisible13 = true;
          });
        }
      }
      if ((item['city'] == widget.city) && (item['category'] == 'Other')) {
        setState(() {
          isVisible14 = true;
        });
      }
      if ((item['city'] == widget.city) && (item['category'] == 'Police')) {
        setState(() {
          isVisible15 = true;
        });
      }
      if ((item['city'] == widget.city) &&
          (item['category'] == 'Quarantine Facility')) {
        setState(() {
          isVisible16 = true;
        });
      }
      if ((item['city'] == widget.city) &&
          (item['category'] == 'Senior Citizen Support')) {
        setState(() {
          isVisible17 = true;
        });
      }
      if ((item['city'] == widget.city) &&
          (item['category'] == 'Transportation')) {
        setState(() {
          isVisible18 = true;
        });
      }
      if (isVisible1 == false &&
          isVisible2 == false &&
          isVisible3 == false &&
          isVisible4 == false &&
          isVisible5 == false &&
          isVisible6 == false &&
          isVisible7 == false &&
          isVisible8 == false &&
          isVisible9 == false &&
          isVisible10 == false &&
          isVisible11 == false &&
          isVisible12 == false &&
          isVisible13 == false &&
          isVisible14 == false &&
          isVisible15 == false &&
          isVisible16 == false &&
          isVisible17 == false &&
          isVisible18 == false) {
        _showDialog();
      }
    });
  }

  void _showDialog() {
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
                      context, MaterialPageRoute(builder: (context) => App()));
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.city);
    void _toApp() {
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 600),
            child: App()),
      );
    }

    return WillPopScope(
        onWillPop: () {
          _toApp();
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
                      child: App()),
                ),
              ),
              backgroundColor: Colors.white,
              iconTheme: new IconThemeData(color: Colors.black),
              title: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Select Resource",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              elevation: 0,
            ),
            body: Container(
              padding: EdgeInsets.all(10.0),
//        child: ListView.builder(
//          padding: const EdgeInsets.all(8),
//          itemCount: entries.length,
//          itemBuilder: (BuildContext context, int index) {
//            return Container(
//              height: 50,
//              child: Padding(
//                  padding: const EdgeInsets.only(bottom: 10),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.only(bottom: 10.0),
//                        child: InkWell(
//                            child: AutoSizeText(
//                              '${entries[index]}',
//                              textAlign: TextAlign.left,
//                            ),
//                            onTap: () {
//                              debugPrint(entries[index]);
//                              category = entries[index];
//                              Navigator.pushReplacement(
//                                context,
//                                MaterialPageRoute(
//                                  builder: (context) => Resources(
//                                    title: widget.city,
//                                    city: widget.city,
//                                    category: category,
//                                  ),
//                                ),
//                              );
//                            }),
//                      ),
//                      Divider(
//                        color: Colors.grey,
//                        height: 10,
//                        thickness: 0.8,
//                      ),
//                    ],
//                  )
//
//                  ),
//            );
//          },
//        ),

              child: ListView(children: <Widget>[
                Visibility(
                  visible: isVisible1 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //        margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/1.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Accommodation and Shelter Homes",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category =
                                                'Accommodation and Shelter Homes';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //   ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible2 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //       child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //      margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/2.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Ambulance",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0),
                                          ),
                                          onTap: () {
                                            category = 'Ambulance';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //    ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible3 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/3.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "CoVID-19 Testing Lab ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'CoVID-19 Testing Lab';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible4 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/4.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Community Kitchen ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Community Kitchen';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible5 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/5.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Delivery [Groceries, Medicines, etc.] ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category =
                                                'Delivery [Vegetables, Fruits, Groceries, Medicines, etc.]';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible6 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/6.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Fever Clinic",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Fever Clinic';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible7 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/7.PNG'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Fire Brigade",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Fire Brigade';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible8 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //        margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/16.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Free Food",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Free Food';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //   ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible9 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/8.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Fundraisers",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Fundraisers';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible10 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/9.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Government Helpline",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Government Helpline';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible11 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //        margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/17.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Helpline for Cyclone Amphan",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category =
                                                'Helpline for Cyclone Amphan';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //   ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible12 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/10.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Hospitals and Centers",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Hospitals and Centers';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible13 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/11.PNG'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Mental and Emotional Support",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category =
                                                'Mental well being and Emotional Support';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible14 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //        margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/18.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Other",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Other';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //   ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible15 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/12.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Police",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Police';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible16 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/13.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Quarantine Facility",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Quarantine Facility';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible17 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      //      child: FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //            margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/14.PNG'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Senior Citizen Support",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Senior Citizen Support';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //  ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible18 == true ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Material(
                        color: Colors.white,
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(5.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          children: <Widget>[
                            Container(
                              //        margin: EdgeInsets.only(left: 20.0, right: 10.0),
                              padding: EdgeInsets.all(10.0),
                              width: 60,
                              height: 60,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(30.0),
                                child: GestureDetector(
                                  child: Image(
                                    alignment: Alignment.center,
                                    image: AssetImage('images/nearby/20.jpg'),
                                  ),

                                  //link for doctor /medicine
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10.0,
                                  right: 5.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      GestureDetector(
                                          child: Text(
                                            "Transportation",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0),
                                          ),
                                          onTap: () {
                                            category = 'Transportation';
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Resources(
                                                  title: widget.city,
                                                  city: widget.city,
                                                  category: category,
                                                ),
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      //   ),
                    ),
                  ),
                ),
              ]),
            )));
  }
}
