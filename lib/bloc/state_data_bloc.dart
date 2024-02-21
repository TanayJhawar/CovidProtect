import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:sakecblue/data/models/my_state_single_value.dart';
import 'package:sakecblue/data/repos/patientrepository.dart';
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
    // TODO: implement mapEventToState

    yield StateDataLoading();
    if (event is GetStatePatientData) {
      String stateCode = event.stateCode;
      try {
        Map<String, String> stateNamesMap = {
          "alberta":"alberta",
          "british-columbia" :"british columbia",
          "diamond-princess":"diamond princess","grand-princess":"grand princess",
          "manitoba":"manitoba",
          "new-brunswick":"new-brunswick",
          "newfoundland-and-labrador":"newfoundland and labrador","northwest-territories":"northwest territories",
          "nova-scotia":"nova scotia","ontario":"ontario","prince-edward-island": "prince edward island","quebec":"quebec","saskatchewan":"saskatchewan","yukon":"yukon",
        };
        final statePatientData = await patientRepository.fetchStatePatientDailyData(stateNamesMap [stateCode]);
        final statePatientMap  = await patientRepository.StatePatientDailyData();

        yield StateDataLoaded(patientDataMap: statePatientData,statePatientMap:statePatientMap);
      } catch (error) {
        print(error);
        yield StateDataError(error: "Data Couldn't be Loaded.");
      }
    } else {
      yield StateDataError(error: "Data Couldn't be Loaded.");
    }
  }
}
