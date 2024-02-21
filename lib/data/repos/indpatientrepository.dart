
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:sakecblue/data/models/indmy_state_data.dart';
import 'package:sakecblue/data/models/indmy_state_single_value.dart';

import 'package:http/http.dart' as http;


abstract class IndPatientRepository {
  Future<Map<String, List>> fetchPatientData();
  Future<Map<String, List<IndMyStateSingleValue>>> fetchStatePatientDailyData(String stateCode);
  Future<List<IndMyStateData>> fetchDistrictWiseData(String stateCode);
}

class IndCovidPatientRepository extends IndPatientRepository {
  static const String CLASS_TAG = "PatientRepository";
  @override
  Future<Map<String, List>> fetchPatientData() async {
    Map<String, List> indpatientDataMap = Map();
    List<IndMyStateData> indstateDataList = List();

    String url = "https://api.covid19india.org/data.json";
    var res = await http.get(Uri.encodeFull(url), headers: {
      "Accept": "appplication/json"
    });

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var stateWise = data["statewise"] as List;

      indstateDataList = stateWise.map<IndMyStateData>((json) => IndMyStateData.fromJson(json)).toList();
      indpatientDataMap["state_wise_data"] = indstateDataList;

    } else {
      print("Error Thrown");
      throw Error();
    }


    return indpatientDataMap;
  }

  @override
  Future<Map<String, List<IndMyStateSingleValue>>> fetchStatePatientDailyData(String stateCode) async {
    Map<String, List<IndMyStateSingleValue>> indstatePatientDataMap = Map();


    String stateDailyDataUrl = "https://api.covid19india.org/states_daily.json";

    var stateDailyRes = await http.get(Uri.encodeFull(stateDailyDataUrl), headers: {
      "Accept": "appplication/json",
    });

    if (stateDailyRes.statusCode == 200) {
      var jsonData = json.decode(stateDailyRes.body);
      var dailyStateData = jsonData["states_daily"] as List;
      var confirmedDailyData = dailyStateData.where((item) => item["status"] == "Confirmed").toList();
      var recoveredDailyData = dailyStateData.where((item) => item["status"] == "Recovered").toList();
      var deathsDailyData = dailyStateData.where((item) => item["status"] == "Deceased").toList();

      var cnfStateDataList = confirmedDailyData.map((item) {
        String date = item["date"];
        List<String> dateStringList = date.split("-");
        dateStringList[dateStringList.length - 1] = "2020";
        date = dateStringList.join("-");
        return IndMyStateSingleValue(
          stateCode: stateCode,
          status: "Confirmed",
          value: int.tryParse(item[stateCode.toLowerCase()]),
          dateString: date,
        );
      }).toList();
      var rcvrdStateDataList = recoveredDailyData.map((item) {
        String date = item["date"];
        List<String> dateStringList = date.split("-");
        dateStringList[dateStringList.length - 1] = "2020";
        date = dateStringList.join("-");
        return IndMyStateSingleValue(
          stateCode: stateCode,
          status: "Recovered",
          value: int.tryParse(item[stateCode.toLowerCase()]),
          dateString: date,
        );
      }).toList();
      var deathsStateDataList = deathsDailyData.map((item) {
        String date = item["date"];
        List<String> dateStringList = date.split("-");
        dateStringList[dateStringList.length - 1] = "2020";
        date = dateStringList.join("-");
        return IndMyStateSingleValue(
          stateCode: stateCode,
          status: "Deaths",
          value: int.tryParse(item[stateCode.toLowerCase()]),
          dateString: date,
        );
      }).toList();
      List<IndMyStateSingleValue> activeStateDataList = List();
      List<IndMyStateSingleValue> cnfStateCumulativeDataList = List();
      List<IndMyStateSingleValue> rcvrdStateCumulativeDataList = List();
      List<IndMyStateSingleValue> deathsStateCumulativeDataList = List();
      List<IndMyStateSingleValue> activeStateCumulativeDataList = List();
      int cumulativeCnfValue = 0;
      int cumulativeRcvrdValue = 0;
      int cumulativeDeathsValue = 0;
      int cumulativeActiveValue = 0;
      for (int index = 0; index < cnfStateDataList.length; index++) {
        IndMyStateSingleValue cnfStateData = cnfStateDataList[index];
        IndMyStateSingleValue rcvrdStateData = rcvrdStateDataList.firstWhere((item) => item.dateEquals(cnfStateData.dateString));
        IndMyStateSingleValue deathsStateData = deathsStateDataList.firstWhere((item) => item.dateEquals(cnfStateData.dateString));
        IndMyStateSingleValue activeStateData = IndMyStateSingleValue(stateCode: stateCode, status: "Active", dateString: cnfStateData.dateString, value: (cnfStateData.value - rcvrdStateData.value - deathsStateData.value));

        cumulativeCnfValue += cnfStateData.value;
        cumulativeRcvrdValue += rcvrdStateData.value;
        cumulativeDeathsValue += deathsStateData.value;
        cumulativeActiveValue += activeStateData.value;
        activeStateDataList.add(activeStateData);
        cnfStateCumulativeDataList.add(IndMyStateSingleValue(stateCode: stateCode, status: "Confirmed", dateString: cnfStateData.dateString, value: cumulativeCnfValue));
        rcvrdStateCumulativeDataList.add(IndMyStateSingleValue(stateCode: stateCode, status: "Recovered", dateString: cnfStateData.dateString, value: cumulativeRcvrdValue));
        deathsStateCumulativeDataList.add(IndMyStateSingleValue(stateCode: stateCode, status: "Deaths", dateString: cnfStateData.dateString, value: cumulativeDeathsValue));
        activeStateCumulativeDataList.add(IndMyStateSingleValue(stateCode: stateCode, status: "Active", dateString: cnfStateData.dateString, value: cumulativeActiveValue));
      }

      print("List is: " + activeStateDataList.toString());
      indstatePatientDataMap["cnf_state_daily_data"] = cnfStateDataList.reversed.toList();
      indstatePatientDataMap["rcvrd_state_daily_data"] = rcvrdStateDataList.reversed.toList();
      indstatePatientDataMap["deaths_state_daily_data"] = deathsStateDataList.reversed.toList();
      indstatePatientDataMap["active_state_daily_data"] = activeStateDataList.reversed.toList();
      indstatePatientDataMap["cnf_state_cumulative_data"] = cnfStateCumulativeDataList.reversed.toList();
      indstatePatientDataMap["rcvrd_state_cumulative_data"] = rcvrdStateCumulativeDataList.reversed.toList();
      indstatePatientDataMap["deaths_state_cumulative_data"] = deathsStateCumulativeDataList.reversed.toList();
      indstatePatientDataMap["active_state_cumulative_data"] = activeStateCumulativeDataList.reversed.toList();
    } else {
      print("Status Code is not Okay.");
      throw Error();
    }

    return indstatePatientDataMap;
  }

  @override
  Future<List<IndMyStateData>> fetchDistrictWiseData(String stateCode) async {
    List<IndMyStateData> inddistrictWiseData = List();
    String districtWiseUrl = "https://api.covid19india.org/v2/state_district_wise.json";
    var districtWiseRes = await http.get(Uri.encodeFull(districtWiseUrl), headers: {
      "Accept": "appplication/json",
    });

    if (districtWiseRes.statusCode == 200) {
      var jsonData = json.decode(districtWiseRes.body) as List;

      var stateData = jsonData.firstWhere((item) => item["statecode"] == stateCode.toUpperCase() || item["statecode"] == stateCode.toLowerCase());
      var districtData = stateData["districtData"] as List;
      inddistrictWiseData = districtData.map<IndMyStateData>((json) => IndMyStateData.fromDistrictJson(json)).toList();
    } else {}


    return inddistrictWiseData;
  }
}
