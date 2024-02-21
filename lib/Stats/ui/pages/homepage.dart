import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Stats/bloc/statewise_bloc.dart';

import 'package:sakecblue/Stats/data/repos/patientrepository.dart';

import 'package:sakecblue/Stats/ui/widgets/india_details.dart';
import 'package:sakecblue/Stats/ui/widgets/loading.dart';
import 'package:sakecblue/Stats/ui/widgets/no_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../page_transition.dart';

class HomePage extends StatelessWidget {
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
          void _toDash() {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }

          return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                statusBarColor: Colors.grey[50],
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
              child: WillPopScope(
                onWillPop: () {
                  _toDash();
                },
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      // onPressed: () => Navigator.push(
                      //   context,
                      //   PageTransition(
                      //       type: PageTransitionType.leftToRightWithFade,
                      //       duration: Duration(milliseconds: 600),
                      //       child: Dash()),
                      // ),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                    ),
                    backgroundColor: Colors.white,
                    iconTheme: new IconThemeData(color: Colors.black),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        "State Stats",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    elevation: 0,
                  ),
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: <Widget>[
                              BlocBuilder<StatewiseBloc, StatewiseState>(
                                builder: (context, state) {
                                  if (state is StatewiseInitial) {
                                    BlocProvider.of<StatewiseBloc>(context)
                                        .add(GetPatientData());
                                  }
                                  if (state is StatewiseLoading) {
                                    return showLoadingScreen();
                                  }
                                  if (state is StatewiseLoaded) {
                                    return showIndiaDetails(
                                        state.patientDataMap);
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
              ));
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
