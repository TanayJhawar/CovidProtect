import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakecblue/data/repos/patientrepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:sakecblue/data/models/my_state_single_value.dart';
part 'statewise_event.dart';
part 'statewise_state.dart';

class StatewiseBloc extends Bloc<StatewiseEvent, StatewiseState> {
  final PatientRepository patientRepository;

  StatewiseBloc({this.patientRepository});

  @override
  StatewiseState get initialState => StatewiseInitial();

  @override
  Stream<StatewiseState> mapEventToState(
      StatewiseEvent event,
      ) async* {
    // TODO: implement mapEventToState
    yield StatewiseLoading();
    if (event is GetPatientData) {
      try {
        final patientData = await patientRepository.fetchPatientData();
        final statePatientMap = await patientRepository.StatePatientDailyData();
        yield StatewiseLoaded(patientDataMap: patientData,statePatientMap:statePatientMap);
      } catch (error) {
        print(error);
        yield StatewiseError(error: "Data couldn't be loaded.");
      }
    }
  }
}