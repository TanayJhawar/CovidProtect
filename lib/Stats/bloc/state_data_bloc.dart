import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:sakecblue/Stats/data/models/my_state_single_value.dart';
import 'package:sakecblue/Stats/data/repos/patientrepository.dart';
import 'package:meta/meta.dart';

part 'state_data_event.dart';
part 'state_data_state.dart';

class StateDataBloc extends Bloc<StateDataEvent, StateDataState> {
  final PatientRepository patientRepository;

  StateDataBloc({@required this.patientRepository});
  @override
  StateDataState get initialState => StateDataInitial();
  @override
  Stream<StateDataState> mapEventToState(StateDataEvent event) async* {
  

    yield StateDataLoading();
    if (event is GetStatePatientData) {
      String stateCode = event.stateCode;
      try {
        final statePatientData = await patientRepository.fetchStatePatientDailyData(stateCode);
        yield StateDataLoaded(patientDataMap: statePatientData);
      } catch (error) {
        print(error);
        yield StateDataError(error: "Data Couldn't be Loaded.");
      }
    } else {
      yield StateDataError(error: "Data Couldn't be Loaded.");
    }
  }
}
