import 'package:sakecblue/animations/widget_enter_anim.dart';
import 'package:sakecblue/bloc/inddistrict_data_bloc.dart';
import 'package:sakecblue/bloc/indstate_data_bloc.dart';
import 'package:sakecblue/data/models/indmy_state_data.dart';
import 'package:sakecblue/data/repos/indpatientrepository.dart';
import 'package:sakecblue/misc/helper.dart';

import 'package:sakecblue/ui/widgets/indpatient_data_table.dart';
import 'package:sakecblue/ui/widgets/indstate_combined_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading.dart';
import 'no_data.dart';

class StateDetails extends StatelessWidget {
  final IndMyStateData indstateData;
  const StateDetails({Key key, @required this.indstateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 0.0,
      ),
      child: Column(
        children: <Widget>[

          BlocBuilder<StateDataBloc, StateDataState>(
            builder: (context, state) {
              if (state is StateDataInitial) {
                BlocProvider.of<StateDataBloc>(context).add(GetStatePatientData(stateCode: indstateData.stateCode));
                return showLoadingScreen();
              }
              if (state is StateDataLoading) {
                return showLoadingScreen();
              }

              if (state is StateDataLoaded) {
                return Column(
                  children: <Widget>[
                    WidgetEnterAnimation(
                      delay: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 16,
                          ),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.blueAccent.withOpacity(0.25),
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: StateCombinedChart(
                            indstatePatientDataMap: state.indpatientDataMap,
                          ),
                        ),
                      ),
                    ),

                  ],
                );
              }
              if (state is StateDataError) {
                return showNoDataScreen();
              }

              return showLoadingScreen();
            },
          ),
          indstateData.stateCode.toUpperCase() != "TT"
              ? BlocBuilder<DistrictDataBloc, DistrictDataState>(
                  builder: (context, state) {
                    if (state is DistrictDataInitial) {
                      BlocProvider.of<DistrictDataBloc>(context).add(GetStateDistrictData(stateCode: indstateData.stateCode));
                      return Container();
                    }
                    if (state is DistrictDataLoading) {
                      return Container();
                    }
                    if (state is DistrictDataLoaded) {
                      return WidgetEnterAnimation(
                        delay: 1.5,
                        child: PatientDataTable(
                          indstateWiseData: state.inddistrictWiseData,
                          isStateDataTable: false,
                        ),
                      );
                    }
                    if (state is DistrictDataError) {
                      return showNoDataScreen();
                    }
                    return Container();
                  },
                )
              : Container(),
        ],
      ),
    );
  }

  Widget showLoadingScreen() {
    return Loading();
  }

  Widget showNoDataScreen() {
    return WidgetEnterAnimation(
      delay: 1,
      child: NoData(),
    );
  }
}
