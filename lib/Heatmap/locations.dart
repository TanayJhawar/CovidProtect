import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Unassigned {
  final String notes;
  final String active;
  final String confirmed;
  final String decreased;
  final String recovered;
  Unassigned(
      {this.notes,
      this.active,
      this.confirmed,
      this.decreased,
      this.recovered});

  factory Unassigned.fromJson(Map<String, dynamic> json) {
    return Unassigned(
      notes: "notes",
      active: "active",
      confirmed: "confirmed",
      decreased: "decreased",
      recovered: "recovered",
    );
  }
}

Future fetchListUser() async {
  final response =
      await http.get('https://api.covid19india.org/state_district_wise.json');
  var users = json.decode(response.body);
  return users;
}

// ignore: non_constant_identifier_names
Future fetchListUser_us() async {
  final response1 = await http.get('https://corona.azure-api.net/country/us/');
  // ignore: non_constant_identifier_names
  var users_us = json.decode(response1.body);
  return users_us;
}

// ignore: non_constant_identifier_names
Future fetchListUser_australia() async {
  final response2 =
      await http.get('https://corona.azure-api.net/country/australia/');
  // ignore: non_constant_identifier_names
  var users_australia = json.decode(response2.body);
  return users_australia;
}

// ignore: non_constant_identifier_names
Future fetchListUser_canada() async {
  final response3 =
      await http.get('https://corona.azure-api.net/country/canada/');
  // ignore: non_constant_identifier_names
  var users_canada = json.decode(response3.body);
  return users_canada;
}

// ignore: non_constant_identifier_names
Future fetchListUser_russia() async {
  final response4 =
      await http.get('https://corona.azure-api.net/country/russia/');
  // ignore: non_constant_identifier_names
  var users_russia = json.decode(response4.body);
  return users_russia;
}

// ignore: non_constant_identifier_names
Future fetchListUser_unitedkingdom() async {
  final response5 =
      await http.get('https://corona.azure-api.net/country/united-kingdom/');
  // ignore: non_constant_identifier_names
  var users_uk = json.decode(response5.body);
  return users_uk;
}

// ignore: non_constant_identifier_names
Future fetchListUser_france() async {
  final response6 =
      await http.get('https://corona.azure-api.net/country/france/');
  // ignore: non_constant_identifier_names
  var users_france = json.decode(response6.body);
  return users_france;
}

// ignore: non_constant_identifier_names
Future fetchListUser_brazil() async {
  final response7 =
      await http.get('https://corona.azure-api.net/country/brazil/');
  // ignore: non_constant_identifier_names
  var users_brazil = json.decode(response7.body);
  return users_brazil;
}

// ignore: non_constant_identifier_names
Future fetchListUser_china() async {
  final response9 =
      await http.get('https://corona.azure-api.net/country/china/');
  // ignore: non_constant_identifier_names
  var users_china = json.decode(response9.body);
  return users_china;
}

// ignore: non_constant_identifier_names
Future fetchListUser_peru() async {
  final response8 =
      await http.get('https://corona.azure-api.net/country/peru/');
  // ignore: non_constant_identifier_names
  var users_peru = json.decode(response8.body);
  return users_peru;
}

// ignore: non_constant_identifier_names
Future fetchListUser_pakistan() async {
  final response10 =
      await http.get('https://corona.azure-api.net/country/pakistan/');
  // ignore: non_constant_identifier_names
  var users_pakistan = json.decode(response10.body);
  return users_pakistan;
}