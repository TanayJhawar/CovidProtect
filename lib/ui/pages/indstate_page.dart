import 'package:sakecblue/animations/widget_enter_anim.dart';
import 'package:sakecblue/bloc/inddistrict_data_bloc.dart';
import 'package:sakecblue/bloc/indstate_data_bloc.dart';
import 'package:sakecblue/data/models/indmy_state_data.dart';
import 'package:sakecblue/data/repos/indpatientrepository.dart';

import 'package:sakecblue/ui/widgets/indstate_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatePage extends StatelessWidget {
  final String title;
  final IndMyStateData indstateData;
  const StatePage({Key key, @required this.title, @required this.indstateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StateDataBloc>(
          create: (BuildContext context) => StateDataBloc(
            indpatientRepository: IndCovidPatientRepository(),
          ),
        ),
        BlocProvider<DistrictDataBloc>(
          create: (BuildContext context) => DistrictDataBloc(
            indpatientRepository: IndCovidPatientRepository(),
          ),
        ),
      ],
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[50],
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(

            body: SafeArea(
              child: ListView(
                addAutomaticKeepAlives: true,
                shrinkWrap: true,
                children: <Widget>[

                  WidgetEnterAnimation(
                    delay: 0,
                    child: StateDetails(
                      indstateData: indstateData,
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
