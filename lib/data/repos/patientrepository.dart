import 'dart:convert';


import 'package:sakecblue/data/models/my_state_data.dart';
import 'package:sakecblue/data/models/my_state_single_value.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


abstract class PatientRepository {
  Future<Map<String, List>> fetchPatientData();
  Future<Map<String, List<MyStateSingleValue>>> fetchStatePatientDailyData(String stateCode);
  Future<Map<String, List<MyStateSingleValue>>> StatePatientDailyData();
}

class CovidPatientRepository extends PatientRepository {
  static const String CLASS_TAG = "PatientRepository";
  @override
  Future<Map<String, List>> fetchPatientData() async {
    Map<String, List> patientDataMap = Map();
    List<MyStateData> stateDataList = List();

    String url = "https://corona.azure-api.net/country/canada";
    var res = await http.get(Uri.encodeFull(url), headers: {
      "Accept": "appplication/json"
    });

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var stateWise = data["State"] as List;

      stateDataList = stateWise.map<MyStateData>((json) => MyStateData.fromJson(json)).toList();
      patientDataMap["state_wise_data"] = stateDataList;

    } else {
      print("Error Thrown");
      throw Error();
    }
    print("List length: ${stateDataList.length}");


    return patientDataMap;
  }

  @override

  Future<Map<String, List<MyStateSingleValue>>> fetchStatePatientDailyData(String stateCode) async {
    Map<String, List<MyStateSingleValue>> statePatientDataMap = Map();
    final birthday = DateTime.tryParse("2020-01-22");
    final date2 = DateTime.now();
    final v= date2.subtract(Duration(days:2 ));
    final difference = v.difference(birthday).inDays;
    final String url = "https://corona.lmao.ninja/v2/historical/Canada/alberta,manitoba,british columbia,diamond princess,nova scotia,grand princess,new brunswick,newfoundland and labrador,ontario,prince edward island,quebec,saskatchewan,yukon,northwest territories?lastdays=$difference";


    var stateDailyRes = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    List<MyStateSingleValue> cnfStateCumulativeDataList = List();
    List<MyStateSingleValue> rcvrdStateCumulativeDataList = List();
    List<MyStateSingleValue> deathsStateCumulativeDataList = List();
    List<MyStateSingleValue> activeStateCumulativeDataList = List();


    int i ;


    var data = json.decode(stateDailyRes.body) as List;
    var canada = data.firstWhere((item) => item["province"] == stateCode);




    for (i =2;i<difference;i++) {
      final DateTime today = DateTime.now();
      final DateFormat formatter = DateFormat('M/d/yy');

      var newFormat = DateFormat("dd-MMM-yyyy");

      final now = today.subtract(Duration(days: i));
      final String formatted = formatter.format(now);
      String updatedDt = newFormat.format(now);




      int v = canada['timeline']['cases'][formatted]??0;
      int l = canada['timeline']['recovered'][formatted]??0;
      int k = canada['timeline']['deaths'][formatted]??0;
      int m = (v-l-k)??0;
      Map<String, String> stateNamesMap = {
        "alberta":"alberta",
        "british-columbia" :"british columbia",
        "diamond-princess":"diamond princess","grand-princess":"grand princess",
        "manitoba":"manitoba",
        "new-brunswick":"new-brunswick",
        "newfoundland-and-labrador":"newfoundland and labrador","northwest-territories":"northwest territories",
        "nova-scotia":"nova scotia","ontario":"ontario","prince-edward-island": "prince edward island","quebec":"quebec","saskatchewan":"saskatchewan","yukon":"yukon",
      };

      cnfStateCumulativeDataList.add(MyStateSingleValue(stateCode:stateNamesMap [stateCode], status: "Confirmed", dateString: updatedDt, value: v));
      rcvrdStateCumulativeDataList.add(MyStateSingleValue(stateCode: stateNamesMap [stateCode], status: "Recovered", dateString: updatedDt, value: l));
      deathsStateCumulativeDataList.add(MyStateSingleValue(stateCode: stateNamesMap [stateCode], status: "Deaths", dateString: updatedDt, value:k));
      activeStateCumulativeDataList.add(MyStateSingleValue(stateCode: stateNamesMap [stateCode], status: "Active", dateString:updatedDt, value: m));



    }
    statePatientDataMap["cnf_state_cumulative_data"] = cnfStateCumulativeDataList.toList();
    statePatientDataMap["rcvrd_state_cumulative_data"] = rcvrdStateCumulativeDataList.toList();
    statePatientDataMap["deaths_state_cumulative_data"] = deathsStateCumulativeDataList.toList();
    statePatientDataMap["active_state_cumulative_data"] = activeStateCumulativeDataList.toList();

    return statePatientDataMap;
  }
  @override
  Future<Map<String, List<MyStateSingleValue>>> StatePatientDailyData( ) async {
    Map<String, List<MyStateSingleValue>> statePatientMap = Map();





    final String url = "https://api-corona.azurewebsites.net/timeline/canada";


    var stateDailyRes = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    List<MyStateSingleValue> cnfStateCumulativeDataList = List();
    List<MyStateSingleValue> rcvrdStateCumulativeDataList = List();
    List<MyStateSingleValue> deathsStateCumulativeDataList = List();
    List<MyStateSingleValue> activeStateCumulativeDataList = List();


    int i ;


    var data = json.decode(stateDailyRes.body) as List;





    for (i =0;i<data.length;i++) {
      final first = DateTime(2020,01,22);

      final DateFormat formatter = DateFormat('MM-dd-yyyy');
      final date= first.add(Duration(days:i ));
      final String formatted = formatter.format(date);
      var canada = data.firstWhere((item) => item["Date"] == formatted);
      final DateTime today = DateTime.now();


      var newFormat = DateFormat("dd-MMM-yyyy");

      final now = today.subtract(Duration(days: i));

      String updatedDt = newFormat.format(now);




      int v = canada['Confirmed']??0;
      int l = canada['Recovered']??0;
      int k = canada['Deaths']??0;
      int m = (v-l-k)??0;

      cnfStateCumulativeDataList.add(MyStateSingleValue(stateCode: "", status: "Confirmed", dateString: updatedDt, value: v));
      rcvrdStateCumulativeDataList.add(MyStateSingleValue(stateCode:'', status: "Recovered", dateString: updatedDt, value: l));
      deathsStateCumulativeDataList.add(MyStateSingleValue(stateCode: '', status: "Deaths", dateString: updatedDt, value:k));
      activeStateCumulativeDataList.add(MyStateSingleValue(stateCode: '', status: "Active", dateString:updatedDt, value: m));



    }
    statePatientMap["cnf_state_cumulative_data"] = cnfStateCumulativeDataList.toList();
    statePatientMap["rcvrd_state_cumulative_data"] = rcvrdStateCumulativeDataList.toList();
    statePatientMap["deaths_state_cumulative_data"] = deathsStateCumulativeDataList.toList();
    statePatientMap["active_state_cumulative_data"] = activeStateCumulativeDataList.toList();
    print(statePatientMap);
    return statePatientMap;
  }
}
