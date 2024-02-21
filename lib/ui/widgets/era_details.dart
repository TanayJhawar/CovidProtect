


import 'package:sakecblue/data/models/eramy_state_data.dart';




import 'package:sakecblue/ui/widgets/erapatient_data_table.dart';


import 'package:flutter/material.dart';


class IndiaDetails extends StatelessWidget {
  final Map<String, List> erapatientDataMap;
  List<EraMyStateData> erastateWiseData;

  EraMyStateData eratotalStateData;

  IndiaDetails({@required this.erapatientDataMap}) {
    erastateWiseData = this.erapatientDataMap["state_wise_data"];

    eratotalStateData = erastateWiseData.firstWhere((item) => item.stateCode == "Scotland");
    print(eratotalStateData);
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
            erastateWiseData: erastateWiseData,
            isStateDataTable: true,
          )
        ],
      ),
    );
  }
}
