import 'package:sakecblue/animations/widget_enter_anim.dart';
import 'package:sakecblue/data/models/ausmy_state_data.dart';
import 'package:sakecblue/misc/helper.dart';
import 'package:sakecblue/ui/pages/ausstate_page.dart';
import 'package:flutter/material.dart';

class PatientDataTable extends StatefulWidget {
  final List<AusMyStateData> ausstateWiseData;
  final double _rowAnimDelay = 1.5;
  final bool isStateDataTable;

  PatientDataTable({Key key, @required this.ausstateWiseData, @required this.isStateDataTable}) : super(key: key);

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
                      child: buildTableRow(0, widget.ausstateWiseData.firstWhere((item) => item.stateCode == "South Australia")),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  List<Widget> buildTable() {
    return List<Widget>.generate(widget.ausstateWiseData.length, (index) {
      if (widget.ausstateWiseData[index].stateCode == "South Australia") {
        return Container();
      }
      return buildTableRow(index, widget.ausstateWiseData[index]);
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




  Widget buildTableRow(int index, AusMyStateData ausstateData) {



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
                      title: ausstateData.stateCode,
                      ausstateData: ausstateData,
                    ),
                    settings: RouteSettings(name: "home/india/${ausstateData.state}/details_page"),
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
                     ausstateData.state,
                        style: TextStyle(
                          fontWeight: ausstateData.stateCode != "" ? FontWeight.w600 : FontWeight.w900,
                          fontSize: ausstateData.stateCode != "" ? 14 : 16,
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
                        ausstateData.todayConfirmed != 0
                            ? Text(
                          ausstateData.stateCode != "Australian Capital Territory" ? (ausstateData.todayConfirmed.isNegative ? "" : "+") + Helper.formatNumber(ausstateData.todayConfirmed) : Helper.formatNumberAsThousands(ausstateData.todayConfirmed),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.blueAccent,
                                ),
                              )
                            : Container(),
                        Text(
                          ausstateData.confirmed == 0 ? "-" : (ausstateData.state != "Australian Capital Territory" && ausstateData.confirmed < 100000 ? Helper.formatNumber(ausstateData.confirmed) : Helper.formatNumberAsThousands(ausstateData.confirmed)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ausstateData.stateCode != "Australian Capital Territory" ? Colors.black.withAlpha(170) : Colors.blueAccent,
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
                          ausstateData.active == 0 ? "-" : (ausstateData.stateCode !="Australian Capital Territory" && ausstateData.active < 100000 ? Helper.formatNumber(ausstateData.active) : Helper.formatNumberAsThousands(ausstateData.active)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ausstateData.stateCode !="Australian Capital Territory" ? Colors.black.withAlpha(170) : Colors.amberAccent[700],
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
                          ausstateData.recovered == 0 ? "-" : (ausstateData.stateCode != "Australian Capital Territory" && ausstateData.recovered < 100000 ? Helper.formatNumber(ausstateData.recovered) : Helper.formatNumberAsThousands(ausstateData.recovered)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ausstateData.stateCode != "Australian Capital Territory" ? Colors.black.withAlpha(170) : Colors.greenAccent[700],
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
                        ausstateData.todayDeaths != 0
                            ? Text(
                          ausstateData.stateCode != "Australian Capital Territory" ? (ausstateData.todayDeaths.isNegative ? "" : "+") + Helper.formatNumber(ausstateData.todayDeaths) : Helper.formatNumberAsThousands(ausstateData.todayDeaths),
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: Colors.redAccent[700],
                                ),
                              )
                            : Container(),
                        Text(
                          ausstateData.deaths == 0 ? "_" : (ausstateData.stateCode != "Australian Capital Territory" && ausstateData.deaths < 100000 ? Helper.formatNumber(ausstateData.deaths) : Helper.formatNumberAsThousands(ausstateData.deaths)),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ausstateData.stateCode != "Australian Capital Territory"? Colors.black.withAlpha(170) : Colors.redAccent,
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
