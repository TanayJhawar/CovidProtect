import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:sakecblue/data/models/indmy_state_single_value.dart';
import 'package:sakecblue/data/repos/indpatientrepository.dart';
import 'package:meta/meta.dart';

part 'indstate_data_event.dart';
part 'indstate_data_state.dart';

class StateDataBloc extends Bloc<StateDataEvent, StateDataState> {
  final IndPatientRepository indpatientRepository;

  StateDataBloc({@required this.indpatientRepository});
  @override
  StateDataState get initialState => StateDataInitial();

  @override
  Stream<StateDataState> mapEventToState(StateDataEvent event) async* {
    // TODO: implement mapEventToState

    yield StateDataLoading();
    if (event is GetStatePatientData) {
      String stateCode = event.stateCode;
      try {
        final indstatePatientData = await indpatientRepository.fetchStatePatientDailyData(stateCode);
        yield StateDataLoaded(indpatientDataMap: indstatePatientData);
      } catch (error) {
        print(error);
        yield StateDataError(error: "Data Couldn't be Loaded.");
      }
    } else {
      yield StateDataError(error: "Data Couldn't be Loaded.");
    }
  }
}
