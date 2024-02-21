import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:sakecblue/data/models/eramy_state_single_value.dart';
import 'package:sakecblue/data/repos/erapatientrepository.dart';
import 'package:meta/meta.dart';

part 'erastate_data_event.dart';
part 'erastate_data_state.dart';

class StateDataBloc extends Bloc<StateDataEvent, StateDataState> {
  final EraPatientRepository erapatientRepository;

  StateDataBloc({@required this.erapatientRepository});
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
          "Scotland":"mainland",
          "Anguilla" :"anguilla",
          "Bermuda":"bermuda",
          "British Virgin Islands":"british virgin islands",
          "Cayman Islands":"cayman islands",
          "Channel Islands":"channel islands",
          "Falkland Islands (Malvinas)":"falkland islands (malvinas)",
          "Gibraltar":"gibraltar",
          "Isle of Man":"isle of man",
          "Montserrat":"montserrat",
          "Turks and Caicos Islands":"turks and caicos islands",
          "England":"mainland",
          "Northern Ireland":"mainland",
          "Unknown":"mainland",
          "Wales":"mainland",
          "":"mainland",

        };
        final erastatePatientData = await erapatientRepository.fetchStatePatientDailyData(stateNamesMap[stateCode]);
        yield StateDataLoaded(erapatientDataMap: erastatePatientData);
      } catch (error) {
        print(error);
        yield StateDataError(error: "Data Couldn't be Loaded.");
      }
    } else {
      yield StateDataError(error: "Data Couldn't be Loaded.");
    }
  }
}
