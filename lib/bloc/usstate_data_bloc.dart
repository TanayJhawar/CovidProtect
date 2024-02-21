import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:sakecblue/data/models/usmy_state_single_value.dart';
import 'package:sakecblue/data/repos/uspatientrepository.dart';
import 'package:meta/meta.dart';

part 'usstate_data_event.dart';
part 'usstate_data_state.dart';

class StateDataBloc extends Bloc<StateDataEvent, StateDataState> {
  final UsPatientRepository uspatientRepository;

  StateDataBloc({@required this.uspatientRepository});
  @override
  StateDataState get initialState => StateDataInitial();

  @override
  Stream<StateDataState> mapEventToState(StateDataEvent event) async* {
    // TODO: implement mapEventToState

    yield StateDataLoading();
    if (event is GetStatePatientData) {
      String stateCode = event.stateCode;
      try {
        final usstatePatientData = await uspatientRepository.fetchStatePatientDailyData(stateCode);
        yield StateDataLoaded(uspatientDataMap: usstatePatientData);
      } catch (error) {
        print(error);
        yield StateDataError(error: "Data Couldn't be Loaded.");
      }
    } else {
      yield StateDataError(error: "Data Couldn't be Loaded.");
    }
  }
}
