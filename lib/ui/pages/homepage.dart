import 'package:sakecblue/bloc/statewise_bloc.dart';

import 'package:sakecblue/data/repos/patientrepository.dart';


import 'package:sakecblue/data/models/my_state_single_value.dart';
import 'package:sakecblue/ui/widgets/india_details.dart';
import 'package:sakecblue/ui/widgets/loading.dart';
import 'package:sakecblue/ui/widgets/no_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StatewiseBloc>(
          create: (BuildContext context) => StatewiseBloc(
            patientRepository: CovidPatientRepository(),
          ),
        ),

      ],
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.grey[50],
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Go back!'),
                          ),

                          BlocBuilder<StatewiseBloc, StatewiseState>(
                            builder: (context, state) {
                              if (state is StatewiseInitial) {
                                BlocProvider.of<StatewiseBloc>(context).add(GetPatientData());
                              }
                              if (state is StatewiseLoading) {
                                return showLoadingScreen();
                              }
                              if (state is StatewiseLoaded) {
                                return showIndiaDetails(state.patientDataMap);
                              }
                              if (state is StatewiseError) {
                                print(state.error);
                                return showNoDataScreen();
                              }
                              return showLoadingScreen();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // bottomNavigationBar: AnimatedBottomBar(navBarItems: navBarItems),
            ),
          );
        },
      ),
    );
  }

  Widget showIndiaDetails(Map<String, List> patientDataMap) {
    return IndiaDetails(
      patientDataMap: patientDataMap,

    );
  }

  Widget showLoadingScreen() {
    return Loading();
  }

  Widget showNoDataScreen() {
    return NoData();
  }
}