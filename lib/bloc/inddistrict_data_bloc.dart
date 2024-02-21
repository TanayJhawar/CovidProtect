import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sakecblue/data/models/indmy_state_data.dart';

import 'package:sakecblue/data/repos/indpatientrepository.dart';
import 'package:meta/meta.dart';

part 'inddistrict_data_event.dart';
part 'inddistrict_data_state.dart';

class DistrictDataBloc extends Bloc<DistrictDataEvent, DistrictDataState> {
  final IndPatientRepository indpatientRepository;
  DistrictDataBloc({@required this.indpatientRepository});
  @override
  DistrictDataState get initialState => DistrictDataInitial();

  @override
  Stream<DistrictDataState> mapEventToState(DistrictDataEvent event) async* {
    // TODO: implement mapEventToState
    yield DistrictDataLoading();
    if (event is GetStateDistrictData) {
      String stateCode = event.stateCode;
      try {
        final inddistrictWiseData = await indpatientRepository.fetchDistrictWiseData(stateCode);
        yield DistrictDataLoaded(inddistrictWiseData: inddistrictWiseData);
      } catch (error) {
        print(error);
        yield DistrictDataError(error: "Data Couldn't be Loaded.");
      }
    }
  }
}
