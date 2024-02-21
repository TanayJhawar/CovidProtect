import 'package:sakecblue/animations/widget_enter_anim.dart';

import 'package:sakecblue/bloc/usstate_data_bloc.dart';
import 'package:sakecblue/data/models/usmy_state_data.dart';


import 'package:sakecblue/ui/widgets/uspatient_data_table.dart';
import 'package:sakecblue/ui/widgets/usstate_combined_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading.dart';
import 'no_data.dart';

class StateDetails extends StatelessWidget {
  final UsMyStateData usstateData;
  const StateDetails({Key key, @required this.usstateData}) : super(key: key);

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
                BlocProvider.of<StateDataBloc>(context).add(GetStatePatientData(stateCode: usstateData.stateCode));
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
                            usstatePatientDataMap: state.uspatientDataMap,
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
