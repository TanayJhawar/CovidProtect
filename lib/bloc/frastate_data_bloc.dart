import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:sakecblue/data/models/framy_state_single_value.dart';
import 'package:sakecblue/data/repos/frapatientrepository.dart';
import 'package:meta/meta.dart';

part 'frastate_data_event.dart';
part 'frastate_data_state.dart';

class StateDataBloc extends Bloc<StateDataEvent, StateDataState> {
  final FraPatientRepository frapatientRepository;

  StateDataBloc({@required this.frapatientRepository});
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
          "":"mainland",
          "St Martin" :"st martin",
          "Saint Barthelemy":"saint barthelemy",
          "French Polynesia":"french polynesia",
          "French Guiana":"french guiana",
          "Mayotte":"mayotte",
          "Guadeloupe":"guadeloupe",
          "Reunion":"reunion",
          "New Caledonia":"new caledonia",
          "Martinique":"martinique",
          "Saint Pierre and Miquelon":"saint pierre and miquelon"

        };
        final frastatePatientData = await frapatientRepository.fetchStatePatientDailyData(stateNamesMap[stateCode]);
        yield StateDataLoaded(frapatientDataMap: frastatePatientData);
      } catch (error) {
        print(error);
        yield StateDataError(error: "Data Couldn't be Loaded.");
      }
    } else {
      yield StateDataError(error: "Data Couldn't be Loaded.");
    }
  }
}
