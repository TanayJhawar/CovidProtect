


import 'package:sakecblue/data/models/framy_state_data.dart';




import 'package:sakecblue/ui/widgets/frapatient_data_table.dart';


import 'package:flutter/material.dart';


class IndiaDetails extends StatelessWidget {
  final Map<String, List> frapatientDataMap;
  List<FraMyStateData> frastateWiseData;

  FraMyStateData fratotalStateData;

  IndiaDetails({@required this.frapatientDataMap}) {
    frastateWiseData = this.frapatientDataMap["state_wise_data"];

    fratotalStateData = frastateWiseData.firstWhere((item) => item.stateCode == "");
    print(fratotalStateData);
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
            frastateWiseData: frastateWiseData,
            isStateDataTable: true,
          )
        ],
      ),
    );
  }
}
