


import 'package:sakecblue/data/models/usmy_state_data.dart';




import 'package:sakecblue/ui/widgets/uspatient_data_table.dart';


import 'package:flutter/material.dart';


class IndiaDetails extends StatelessWidget {
  final Map<String, List> uspatientDataMap;
  List<UsMyStateData> usstateWiseData;

  UsMyStateData ustotalStateData;

  IndiaDetails({@required this.uspatientDataMap}) {
    usstateWiseData = this.uspatientDataMap["state_wise_data"];

    ustotalStateData = usstateWiseData.firstWhere((item) => item.state == "AK");

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
            usstateWiseData: usstateWiseData,
            isstateDataTable: true,
          )
        ],
      ),
    );
  }
}
