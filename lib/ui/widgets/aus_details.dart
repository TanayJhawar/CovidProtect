


import 'package:sakecblue/data/models/ausmy_state_data.dart';




import 'package:sakecblue/ui/widgets/auspatient_data_table.dart';


import 'package:flutter/material.dart';


class IndiaDetails extends StatelessWidget {
  final Map<String, List> auspatientDataMap;
  List<AusMyStateData> ausstateWiseData;

  AusMyStateData austotalStateData;

  IndiaDetails({@required this.auspatientDataMap}) {
    ausstateWiseData = this.auspatientDataMap["state_wise_data"];

    austotalStateData = ausstateWiseData.firstWhere((item) => item.stateCode == "South Australia");
    print(austotalStateData);
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
            ausstateWiseData: ausstateWiseData,
            isStateDataTable: true,
          )
        ],
      ),
    );
  }
}
