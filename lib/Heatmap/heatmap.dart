import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:sakecblue/Dashboard/dashboard.dart';
import '../page_transition.dart';
import 'locations.dart' as users;
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(HeatMap());

class HeatMap extends StatefulWidget {
  @override
  _heatmapstate createState() => _heatmapstate();
}

// ignore: camel_case_types
class _heatmapstate extends State<HeatMap> {
  Set<Circle> _circles = {};
  Map<String, dynamic> districtsCoodinatesData;

  List density(int active) {
    List l1 = [];
    Color fillCircle = Colors.white;
    Color strokeCircle = Colors.white;
    double radius = 0.0;
    if (active < 0) {
      active = active * -1;
    }
    if (active > 10000) {
      radius = 120000;
      fillCircle = Colors.blue[900].withOpacity(0.7);
      strokeCircle = Colors.blue[900];
    } else if (active > 7000) {
      radius = 90000;
      fillCircle = Colors.blue[900].withOpacity(0.5);
      strokeCircle = Colors.blue[900];
    } else if (active > 6000) {
      radius = 80000;
      fillCircle = Colors.blue[900].withOpacity(0.3);
      strokeCircle = Colors.blue[900];
    } else if (active > 5000) {
      radius = 75000;
      fillCircle = Colors.blue[700].withOpacity(0.7);
      strokeCircle = Colors.blue[700];
    } else if (active > 4000) {
      radius = 70000;
      fillCircle = Colors.blue[700].withOpacity(0.5);
      strokeCircle = Colors.blue[700];
    } else if (active > 3000) {
      radius = 60000;
      fillCircle = Colors.blue[700].withOpacity(0.3);
      strokeCircle = Colors.blue[700];
    } else if (active > 2000) {
      radius = 55000;
      fillCircle = Colors.blue[500].withOpacity(0.7);
      strokeCircle = Colors.blue[500];
    } else if (active > 1500) {
      radius = 50000;
      fillCircle = Colors.blue[500].withOpacity(0.5);
      strokeCircle = Colors.blue[500];
    } else if (active > 1200) {
      radius = 45000;
      fillCircle = Colors.blue[500].withOpacity(0.3);
      strokeCircle = Colors.blue[500];
    } else if (active > 900) {
      radius = 40000;
      fillCircle = Colors.blue[300].withOpacity(0.7);
      strokeCircle = Colors.blue[300];
    } else if (active > 750) {
      radius = 35000;
      fillCircle = Colors.blue[300].withOpacity(0.5);
      strokeCircle = Colors.blue[300];
    } else if (active > 500) {
      radius = 30000;
      fillCircle = Colors.blue[300].withOpacity(0.3);
      strokeCircle = Colors.blue[300];
    } else if (active > 250) {
      radius = 20000;
      fillCircle = Colors.blue[200].withOpacity(0.7);
      strokeCircle = Colors.blue[200];
    } else if (active > 50) {
      radius = 10000;
      fillCircle = Colors.blue[200].withOpacity(0.5);
      strokeCircle = Colors.blue[200];
    } else if (active > 0) {
      radius = 5000;
      fillCircle = Colors.blue[200].withOpacity(0.3);
      strokeCircle = Colors.blue[200];
    }
    l1.add(radius);
    l1.add(fillCircle);
    l1.add(strokeCircle);
    return l1;
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    //dark Mode
    controller
        .setMapStyle(await rootBundle.loadString('assets/map_styles.txt'));

    final officeIndia = await users.fetchListUser();
    await loadCoordinatesJSONFile();
    for (var state in officeIndia.keys) {
      if (state != "State Unassigned") {
        for (var district in officeIndia[state]['districtData'].keys) {
          if (district != "Unknown") {
            addCirclesToMap(state, district,
                officeIndia[state]['districtData'][district]['active']);
          }
        }
      }
    }

    var officeRussia = await users.fetchListUser_russia();
    officeRussia = officeRussia["State"];
    for (var state in officeRussia) {
      // for (var city in state["City"]) {
      addCirclesToMap_(state);
      // }
    }

    var officeChina = await users.fetchListUser_china();
    officeChina = officeChina["State"];
    for (var state in officeChina) {
      // for (var city in state["City"]) {
      addCirclesToMap_(state);
      // }
    }

    var officePakistan = await users.fetchListUser_pakistan();
    officePakistan = officePakistan["State"];
    for (var state in officePakistan) {
      // for (var city in state["City"]) {
      addCirclesToMap_(state);
      // }
    }

    var officeUSA = await users.fetchListUser_us();
    officeUSA = officeUSA["State"];
    for (var state in officeUSA) {
      for (var city in state["City"]) {
        addCirclesToMap1_(city);
      }
    }

    var officeCanada = await users.fetchListUser_canada();
    officeCanada = officeCanada["State"];
    for (var state in officeCanada) {
      //for (var city in state["City"]) {
      addCirclesToMap_(state);
      //}
    }

    var officeBrazil = await users.fetchListUser_brazil();
    officeBrazil = officeBrazil["State"];
    for (var state in officeBrazil) {
      // for (var city in state["City"]) {
      addCirclesToMap_(state);
      // }
    }

    var officePeru = await users.fetchListUser_peru();
    officePeru = officePeru["State"];
    for (var state in officePeru) {
      //for (var city in state["City"]) {
      addCirclesToMap_(state);
      //}
    }

    var officeUK = await users.fetchListUser_unitedkingdom();
    officeUK = officeUK["State"];
    for (var state in officeUK) {
      //for (var city in state["City"]) {
      addCirclesToMap_(state);
      //}
    }

    var officeFrance = await users.fetchListUser_france();
    officeFrance = officeFrance["State"];
    for (var state in officeFrance) {
      //for (var city in state["City"]) {
      addCirclesToMap_(state);
      //}
    }

    var officeAustralia = await users.fetchListUser_australia();
    officeAustralia = officeAustralia["State"];
    for (var state in officeAustralia) {
      addCirclesToMap_(state);
    }
  }

  void addCircle(String district, int count, LatLng latLng) {
    String id = district;
    List l2 = density(count);
    final circle = Circle(
      circleId: CircleId(id),
      center: latLng,
      radius: l2[0],
      fillColor: l2[1],
      strokeWidth: 2,
      strokeColor: l2[2],
    );
    setState(() {
      _circles.add(circle);
    });
  }

  Future<void> loadCoordinatesJSONFile() async {
    var fileString = await rootBundle
        .loadString('assets/districts_of_india_coordinates_updated.json');
    districtsCoodinatesData = json.decode(fileString);
  }

  LatLng findCordinatesFromFile(String state, String district) {
    var coordinates;
    try {
      coordinates = districtsCoodinatesData[state][district];
      if (coordinates != null) {
        double lat = double.parse(coordinates['latitude'].toString());
        double lng = double.parse(coordinates['longitude'].toString());
        return LatLng(lat, lng);
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint(
          "Cordinates not found in JSON file for: " + state + ", " + district);
    }
    return null;
  }

  Future<LatLng> findCordinatesUsingGeocoder(
      String state, String district) async {
    String query = district + ',' + state;
    try {
      List<Address> addresses =
          await Geocoder.local.findAddressesFromQuery(query);
      return LatLng(addresses.first.coordinates.latitude,
          addresses.first.coordinates.longitude);
    } catch (e) {
      debugPrint("Error in GEOCODER - Cordinates not found " +
          state +
          ", " +
          district);
    }
    return null;
  }

  void addCirclesToMap(String state, String district, int count) async {
    var latLng = findCordinatesFromFile(state, district);
    if (latLng == null) {
      latLng = await findCordinatesUsingGeocoder(state, district);
      if (latLng != null) {
        addCircle(district, count, latLng);
      }
    } else {
      addCircle(district, count, latLng);
    }
  }

  // ignore: non_constant_identifier_names
  void addCirclesToMap_(var city) async {
    var lat = city["Lat"];
    var long = city["Long_"];
    int count = city["Active"];
    String district = city["Combined_Key"];
    LatLng latlng = LatLng(lat.toDouble(), long.toDouble());
    print(latlng);
    if (lat != 0 && long != 0) {
      addCircle(district, count, latlng);
    }
  }

  // ignore: non_constant_identifier_names
  void addCirclesToMap1_(var city) async {
    var lat = city["Lat"];
    var long = city["Long_"];
    int count = city["Active"];
    String district = city["City"];
    LatLng latlng = LatLng(lat.toDouble(), long.toDouble());
    print(latlng);
    if (lat != 0 && long != 0) {
      addCircle(district, count, latlng);
    }
  }

  GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue[200]),
            // onPressed: () => Navigator.push(
            //   context,
            //   PageTransition(
            //       type: PageTransitionType.rightToLeft,
            //       duration: Duration(milliseconds: 600),
            //       child: Dash()),
            // ),
            onPressed: () {
              Navigator.pop(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 600),
                    child: null,
                  ));
            }),
        backgroundColor: Color(0xFF202c38),
        iconTheme: new IconThemeData(color: Colors.black),
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            "Heatmap",
            style: TextStyle(
              color: Colors.blue[200],
              fontSize: 20.0,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: const LatLng(20.5937, 78.962),
          zoom: 1,
        ),
        circles: _circles,
      ),
    );
  }
}
