import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakecblue/data/repos/indpatientrepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'indstatewise_event.dart';
part 'indstatewise_state.dart';

class StatewiseBloc extends Bloc<StatewiseEvent, StatewiseState> {
  final IndPatientRepository indpatientRepository;

  StatewiseBloc({this.indpatientRepository});

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
        final indpatientData = await indpatientRepository.fetchPatientData();
        yield StatewiseLoaded(indpatientDataMap: indpatientData);
      } catch (error) {
        print(error);
        yield StatewiseError(error: "Data couldn't be loaded.");
      }
    }
  }
}
