import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:sakecblue/Stats/data/models/my_state_data.dart';

import 'package:sakecblue/Stats/data/repos/patientrepository.dart';
import 'package:meta/meta.dart';

part 'district_data_event.dart';
part 'district_data_state.dart';

class DistrictDataBloc extends Bloc<DistrictDataEvent, DistrictDataState> {
  final PatientRepository patientRepository;
  DistrictDataBloc({@required this.patientRepository});
  @override
  DistrictDataState get initialState => DistrictDataInitial();

  @override
  Stream<DistrictDataState> mapEventToState(DistrictDataEvent event) async* {
 
    yield DistrictDataLoading();
    if (event is GetStateDistrictData) {
      String stateCode = event.stateCode;
      try {
        final districtWiseData = await patientRepository.fetchDistrictWiseData(stateCode);
        yield DistrictDataLoaded(districtWiseData: districtWiseData);
      } catch (error) {
        print(error);
        yield DistrictDataError(error: "Data Couldn't be Loaded.");
      }
    }
  }
}
