import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:sakecblue/data/models/ausmy_state_single_value.dart';
import 'package:sakecblue/data/repos/auspatientrepository.dart';
import 'package:meta/meta.dart';

part 'ausstate_data_event.dart';
part 'ausstate_data_state.dart';

class StateDataBloc extends Bloc<StateDataEvent, StateDataState> {
  final AusPatientRepository auspatientRepository;

  StateDataBloc({@required this.auspatientRepository});
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
          "Australian Capital Territory":"australian capital territory",
          "New South Wales" :"new south wales",
          "Northern Territory":"northern territory",
          "Queensland":"queensland",
          "South Australia":"south australia",
          "Tasmania":"tasmania",
          "Victoria":"victoria",
          "Western Australia":"western australia",

        };
        final ausstatePatientData = await auspatientRepository.fetchStatePatientDailyData(stateNamesMap[stateCode]);
        yield StateDataLoaded(auspatientDataMap: ausstatePatientData);
      } catch (error) {
        print(error);
        yield StateDataError(error: "Data Couldn't be Loaded.");
      }
    } else {
      yield StateDataError(error: "Data Couldn't be Loaded.");
    }
  }
}
