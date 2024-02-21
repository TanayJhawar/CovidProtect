import 'package:sakecblue/Dashboard/dashboard.dart';
import 'package:sakecblue/Stats/animations/widget_enter_anim.dart';
import 'package:sakecblue/Stats/bloc/district_data_bloc.dart';
import 'package:sakecblue/Stats/bloc/state_data_bloc.dart';
import 'package:sakecblue/Stats/data/models/my_state_data.dart';
import 'package:sakecblue/Stats/data/repos/patientrepository.dart';
import 'package:sakecblue/Stats/ui/pages/homepage.dart';

import 'package:sakecblue/Stats/ui/widgets/state_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../page_transition.dart';

class StatePage extends StatelessWidget {
  final String title;
  final MyStateData stateData;
  const StatePage({Key key, @required this.title, @required this.stateData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StateDataBloc>(
          create: (BuildContext context) => StateDataBloc(
            patientRepository: CovidPatientRepository(),
          ),
        ),
        BlocProvider<DistrictDataBloc>(
          create: (BuildContext context) => DistrictDataBloc(
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
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      duration: Duration(milliseconds: 600),
                      child: HomePage()),
                ),
              ),
              backgroundColor: Colors.white,
              iconTheme: new IconThemeData(color: Colors.black),
              title: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "District Stats",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              elevation: 0,
            ),
            body: SafeArea(
              child: ListView(
                addAutomaticKeepAlives: true,
                shrinkWrap: true,
                children: <Widget>[
                  WidgetEnterAnimation(
                    delay: 0,
                    child: StateDetails(
                      stateData: stateData,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
