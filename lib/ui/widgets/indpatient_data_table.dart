import 'package:sakecblue/animations/widget_enter_anim.dart';
import 'package:sakecblue/data/models/indmy_state_data.dart';
import 'package:sakecblue/misc/helper.dart';
import 'package:sakecblue/ui/pages/indstate_page.dart';
import 'package:flutter/material.dart';

class PatientDataTable extends StatefulWidget {
  final List<IndMyStateData> indstateWiseData;
  final double _rowAnimDelay = 1.5;
  final bool isStateDataTable;

  PatientDataTable({Key key, @required this.indstateWiseData, @required this.isStateDataTable}) : super(key: key);

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
                      child: buildTableRow(0, widget.indstateWiseData.firstWhere((item) => item.state == "Total")),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  List<Widget> buildTable() {
    return List<Widget>.generate(widget.indstateWiseData.length, (index) {
      if (widget.indstateWiseData[index].state == "Total") {
        return Container();
      }
      return buildTableRow(index, widget.indstateWiseData[index]);
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
                message: widget.isStateDataTable ? "State Name" : "District Name",
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
                      widget.isStateDataTable ? "State/UT" : "District",
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



  Widget buildTableRow(int index, IndMyStateData indstateData) {
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
                      title: indstateData.state,
                      indstateData: indstateData,
                    ),
                    settings: RouteSettings(name: "home/india/${indstateData.state}/details_page"),
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
                        indstateData.state,
                        style: TextStyle(
                          fontWeight: indstateData.state != "Total" ? FontWeight.w600 : FontWeight.w900,
                          fontSize: indstateData.state != "Total" ? 14 : 16,
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
                        indstateData.todayConfirmed != 0
                            ? Text(
                                indstateData.state != "Total" ? (indstateData.todayConfirmed.isNegative ? "" : "+") + Helper.formatNumber(indstateData.todayConfirmed) : Helper.formatNumberAsThousands(indstateData.todayConfirmed),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.blueAccent,
                                ),
                              )
                            : Container(),
                        Text(
                          indstateData.confirmed == 0 ? "-" : (indstateData.state != "Total" && indstateData.confirmed < 100000 ? Helper.formatNumber(indstateData.confirmed) : Helper.formatNumberAsThousands(indstateData.confirmed)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: indstateData.state != "Total" ? Colors.black.withAlpha(170) : Colors.blueAccent,
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
                        indstateData.todayActive != 0
                            ? Text(
                          indstateData.state != "Total" ? (indstateData.todayActive.isNegative ? "" : "+") + Helper.formatNumber(indstateData.todayActive) : Helper.formatNumberAsThousands(indstateData.todayActive),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.amberAccent[700],
                                ),
                              )
                            : Container(),
                        Text(
                          indstateData.active == 0 ? "-" : (indstateData.state != "Total" && indstateData.active < 100000 ? Helper.formatNumber(indstateData.active) : Helper.formatNumberAsThousands(indstateData.active)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: indstateData.state != "Total" ? Colors.black.withAlpha(170) : Colors.amberAccent[700],
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
                        indstateData.todayRecovered != 0
                            ? Text(
                          indstateData.state != "Total" ? (indstateData.todayRecovered.isNegative ? "" : "+") + Helper.formatNumber(indstateData.todayRecovered) : Helper.formatNumberAsThousands(indstateData.todayRecovered),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.greenAccent[700],
                                ),
                              )
                            : Container(),
                        Text(
                          indstateData.recovered == 0 ? "-" : (indstateData.state != "Total" && indstateData.recovered < 100000 ? Helper.formatNumber(indstateData.recovered) : Helper.formatNumberAsThousands(indstateData.recovered)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: indstateData.state != "Total" ? Colors.black.withAlpha(170) : Colors.greenAccent[700],
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
                        indstateData.todayDeaths != 0
                            ? Text(
                          indstateData.state != "Total" ? (indstateData.todayDeaths.isNegative ? "" : "+") + Helper.formatNumber(indstateData.todayDeaths) : Helper.formatNumberAsThousands(indstateData.todayDeaths),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.redAccent[700],
                                ),
                              )
                            : Container(),
                        Text(
                          indstateData.deaths == 0 ? "_" : (indstateData.state != "Total" && indstateData.deaths < 100000 ? Helper.formatNumber(indstateData.deaths) : Helper.formatNumberAsThousands(indstateData.deaths)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: indstateData.state != "Total" ? Colors.black.withAlpha(170) : Colors.redAccent,
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
