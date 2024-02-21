import 'dart:convert';


import 'package:sakecblue/data/models/ausmy_state_data.dart';
import 'package:sakecblue/data/models/ausmy_state_single_value.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


abstract class AusPatientRepository {
  Future<Map<String, List>> fetchPatientData();
  Future<Map<String, List<AusMyStateSingleValue>>> fetchStatePatientDailyData(String stateCode);

}

class AusCovidPatientRepository extends AusPatientRepository {
  static const String CLASS_TAG = "PatientRepository";
  @override
  Future<Map<String, List>> fetchPatientData() async {
    Map<String, List> auspatientDataMap = Map();
    List<AusMyStateData> ausstateDataList = List();
    final DateTime today = DateTime.now();
    var newFormat = DateFormat("yyyy-MM-dd");
    final now1 = today.subtract(Duration(days: 2));

    String updatedDt1 = newFormat.format(now1);

    String url = "https://covid-api.com/api/reports?date=$updatedDt1&q=australia";
    var res = await http.get(Uri.encodeFull(url), headers: {
      "Accept": "appplication/json"
    });

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var stateWise = data["data"] as List;

      ausstateDataList = stateWise.map<AusMyStateData>((json) => AusMyStateData.fromJson(json)).toList();
      auspatientDataMap["state_wise_data"] = ausstateDataList;

    } else {
      print("Error Thrown");
      throw Error();
    }


    return auspatientDataMap;
  }

  @override

  Future<Map<String, List<AusMyStateSingleValue>>> fetchStatePatientDailyData(String stateCode) async {
    Map<String, List<AusMyStateSingleValue>> statePatientDataMap = Map();
    final birthday = DateTime.tryParse("2020-01-22");
    final date2 = DateTime.now();
    final v= date2.subtract(Duration(days:2 ));
    final difference = v.difference(birthday).inDays;
    final String url = "https://corona.lmao.ninja/v2/historical/australia/australian capital territory,new south wales,northern territory,queensland,south australia,tasmania, victoria,western australia?lastdays=$difference";


    var stateDailyRes = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    List<AusMyStateSingleValue> cnfStateCumulativeDataList = List();
    List<AusMyStateSingleValue> rcvrdStateCumulativeDataList = List();
    List<AusMyStateSingleValue> deathsStateCumulativeDataList = List();
    List<AusMyStateSingleValue> activeStateCumulativeDataList = List();


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

      cnfStateCumulativeDataList.add(AusMyStateSingleValue(stateCode: stateCode, status: "Confirmed", dateString: updatedDt, value: v));
      rcvrdStateCumulativeDataList.add(AusMyStateSingleValue(stateCode:stateCode, status: "Recovered", dateString: updatedDt, value: l));
      deathsStateCumulativeDataList.add(AusMyStateSingleValue(stateCode: stateCode, status: "Deaths", dateString: updatedDt, value:k));
      activeStateCumulativeDataList.add(AusMyStateSingleValue(stateCode: stateCode, status: "Active", dateString:updatedDt, value: m));



    }
    statePatientDataMap["cnf_state_cumulative_data"] = cnfStateCumulativeDataList.toList();
    statePatientDataMap["rcvrd_state_cumulative_data"] = rcvrdStateCumulativeDataList.toList();
    statePatientDataMap["deaths_state_cumulative_data"] = deathsStateCumulativeDataList.toList();
    statePatientDataMap["active_state_cumulative_data"] = activeStateCumulativeDataList.toList();

    return statePatientDataMap;
  }


}
