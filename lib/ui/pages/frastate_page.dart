import 'package:sakecblue/animations/widget_enter_anim.dart';

import 'package:sakecblue/bloc/frastate_data_bloc.dart';
import 'package:sakecblue/data/models/framy_state_data.dart';
import 'package:sakecblue/data/repos/frapatientrepository.dart';

import 'package:sakecblue/ui/widgets/frastate_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatePage extends StatelessWidget {
  final String title;
  final FraMyStateData frastateData;
  const StatePage({Key key, @required this.title, @required this.frastateData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StateDataBloc>(
          create: (BuildContext context) => StateDataBloc(
            frapatientRepository: FraCovidPatientRepository(),
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
                      frastateData: frastateData,
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
