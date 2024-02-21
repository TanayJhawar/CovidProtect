import 'package:sakecblue/animations/widget_enter_anim.dart';
import 'package:sakecblue/data/models/eramy_state_data.dart';
import 'package:sakecblue/misc/helper.dart';
import 'package:sakecblue/ui/pages/erastate_page.dart';
import 'package:flutter/material.dart';

class PatientDataTable extends StatefulWidget {
  final List<EraMyStateData> erastateWiseData;
  final double _rowAnimDelay = 1.5;
  final bool isStateDataTable;

  PatientDataTable({Key key, @required this.erastateWiseData, @required this.isStateDataTable}) : super(key: key);

  @override
  _PatientDataTableState createState() => _PatientDataTableState();
}

class _PatientDataTableState extends State<PatientDataTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 32,
      ),
      child: Column(
        children: <Widget>[
          WidgetEnterAnimation(
            delay: widget._rowAnimDelay,
            child: Column(
              children: <Widget>[
                buildTableHeaderRow()
              ],
            ),
          ),
          WidgetEnterAnimation(
            delay: widget._rowAnimDelay + 0.5,
            child: Column(
              children: buildTable(),
            ),
          ),
          widget.isStateDataTable
              ? Column(
                  children: <Widget>[
                    WidgetEnterAnimation(
                      delay: widget._rowAnimDelay + 0.75,
                      child: buildTableRow(0, widget.erastateWiseData.firstWhere((item) => item.stateCode == "Scotland")),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  List<Widget> buildTable() {
    return List<Widget>.generate(widget.erastateWiseData.length, (index) {
      if (widget.erastateWiseData[index].stateCode == "Scotland") {
        return Container();
      }
      return buildTableRow(index, widget.erastateWiseData[index]);
    });
  }

  Widget buildTableHeaderRow() {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // State Name Cell
            Expanded(
              flex: 16,
              child: Tooltip(
                message: widget.isStateDataTable ? "State Name" : "City Name",
                child: Container(
                  margin: EdgeInsets.only(
                    right: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black.withAlpha(5),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.isStateDataTable ? "State" : "Cities",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.black.withBlue(100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Confirmed Count Cell
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Confirmed",
                child: Container(
                  margin: EdgeInsets.only(
                    right: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blueAccent.withAlpha(10),
                  ),
                  child: Center(
                    child: Text(
                      "Confirmed",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.blueAccent,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Active Count Cell
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Active",
                child: Container(
                  margin: EdgeInsets.only(
                    right: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.amberAccent[700].withAlpha(10),
                  ),
                  child: Center(
                    child: Text(
                      "Active",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.amberAccent[700],
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Recovered Count Cell
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Recovered",
                child: Container(
                  margin: EdgeInsets.only(
                    right: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.greenAccent[700].withAlpha(10),
                  ),
                  child: Center(
                    child: Text(
                      "Recovered",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.greenAccent[700],
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Deaths Count Cell
            Expanded(
              flex: 8,
              child: Tooltip(
                message: "Deaths",
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.redAccent.withAlpha(10),
                  ),
                  child: Center(
                    child: Text(
                      "Death",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.redAccent,
                        fontSize: 10
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




  Widget buildTableRow(int index, EraMyStateData erastateData) {


    Map<String, String> stateNamesMap = {
      "Scotland":"Scotland",
      "Anguilla" :"anguilla",
      "Bermuda":"bermuda",
      "British Virgin Islands":"british virgin islands",
      "Cayman Islands":"cayman islands",
      "Channel Islands":"channel islands",
      "Falkland Islands (Malvinas)":"falkland islands (malvinas)",
      "Gibraltar":"gibraltar",
      "Isle of Man":"isle of man",
      "Montserrat":"montserrat",
      "Turks and Caicos Islands":"turks and caicos islands",
      "England":"England",
      "Northern Ireland":"Northern Ireland",
      "Unknown":"Unknown",
      "Wales":"wales",
      "":"United Arab Emirates",

    };
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              if (widget.isStateDataTable) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatePage(
                      title: erastateData.stateCode,
                      erastateData: erastateData,
                    ),
                    settings: RouteSettings(name: "home/india/${erastateData.state}/details_page"),
                  ),
                );
              }
            },
            borderRadius: BorderRadius.circular(4),
            splashColor: Colors.blueAccent.withOpacity(0.3),
            highlightColor: Colors.blueAccent.withOpacity(0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // State Name Cell
                Expanded(
                  flex: 16,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black.withAlpha(5),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,

                      child: Text(
                    stateNamesMap [erastateData.state],
                        style: TextStyle(
                          fontWeight: erastateData.stateCode != "" ? FontWeight.w600 : FontWeight.w900,
                          fontSize: erastateData.stateCode != "" ? 14 : 16,
                          color: Colors.black.withBlue(100),
                        ),
                      ),
                    ),
                  ),
                ),
                // Confirmed Count Cell
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blueAccent.withAlpha(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        erastateData.todayConfirmed != 0
                            ? Text(
                          erastateData.stateCode != "" ? (erastateData.todayConfirmed.isNegative ? "" : "+") + Helper.formatNumber(erastateData.todayConfirmed) : Helper.formatNumberAsThousands(erastateData.todayConfirmed),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.blueAccent,
                                ),
                              )
                            : Container(),
                        Text(
                          erastateData.confirmed == 0 ? "-" : (erastateData.state != "" && erastateData.confirmed < 100000 ? Helper.formatNumber(erastateData.confirmed) : Helper.formatNumberAsThousands(erastateData.confirmed)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: erastateData.stateCode != "" ? Colors.black.withAlpha(170) : Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Active Count Cell
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.amberAccent[700].withAlpha(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[

                        Text(
                          erastateData.active == 0 ? "-" : (erastateData.stateCode !="" && erastateData.active < 100000 ? Helper.formatNumber(erastateData.active) : Helper.formatNumberAsThousands(erastateData.active)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: erastateData.stateCode !="" ? Colors.black.withAlpha(170) : Colors.amberAccent[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Recovered Count Cell
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.greenAccent[700].withAlpha(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[

                        Text(
                          erastateData.recovered == 0 ? "-" : (erastateData.stateCode != "" && erastateData.recovered < 100000 ? Helper.formatNumber(erastateData.recovered) : Helper.formatNumberAsThousands(erastateData.recovered)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: erastateData.stateCode != "" ? Colors.black.withAlpha(170) : Colors.greenAccent[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Deaths Count Cell
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.redAccent.withAlpha(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        erastateData.todayDeaths != 0
                            ? Text(
                          erastateData.stateCode != "" ? (erastateData.todayDeaths.isNegative ? "" : "+") + Helper.formatNumber(erastateData.todayDeaths) : Helper.formatNumberAsThousands(erastateData.todayDeaths),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.redAccent[700],
                                ),
                              )
                            : Container(),
                        Text(
                          erastateData.deaths == 0 ? "_" : (erastateData.stateCode != "" && erastateData.deaths < 100000 ? Helper.formatNumber(erastateData.deaths) : Helper.formatNumberAsThousands(erastateData.deaths)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: erastateData.stateCode != ""? Colors.black.withAlpha(170) : Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
