

import 'package:sakecblue/data/models/inddaily_data.dart';
import 'package:sakecblue/data/models/indmy_state_data.dart';




import 'package:sakecblue/ui/widgets/indpatient_data_table.dart';


import 'package:flutter/material.dart';


class IndiaDetails extends StatelessWidget {
  final Map<String, List> indpatientDataMap;
  List<IndMyStateData> indstateWiseData;
  List<IndDailyData> inddailyData;
  IndMyStateData indtotalStateData;

  IndiaDetails({@required this.indpatientDataMap}) {
    indstateWiseData = this.indpatientDataMap["state_wise_data"];

    indtotalStateData = indstateWiseData.firstWhere((item) => item.state == "Total");

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
            indstateWiseData: indstateWiseData,
            isStateDataTable: true,
          )
        ],
      ),
    );
  }
}
