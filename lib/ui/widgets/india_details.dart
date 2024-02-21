
import 'package:sakecblue/data/models/my_state_data.dart';


import 'package:sakecblue/ui/widgets/patient_data_table.dart';
import 'package:sakecblue/ui/widgets/state_combined_chart.dart';

import 'package:flutter/material.dart';



class IndiaDetails extends StatelessWidget {



  final Map<String, List> patientDataMap;
 List<MyStateData> stateWiseData;

 MyStateData totalStateData;

  IndiaDetails({ this.patientDataMap}) {
    stateWiseData = this.patientDataMap["state_wise_data"];

    totalStateData = stateWiseData.firstWhere((item) => item.state == "Alberta");


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 0,
      ),
      child: Column(
        children: <Widget>[



          PatientDataTable(
            stateWiseData: stateWiseData,
            isStateDataTable: true,
          )
        ],
      ),

    );
  }
}
