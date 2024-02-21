import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakecblue/data/repos/frapatientrepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'frastatewise_event.dart';
part 'frastatewise_state.dart';

class StatewiseBloc extends Bloc<StatewiseEvent, StatewiseState> {
  final FraPatientRepository frapatientRepository;

  StatewiseBloc({this.frapatientRepository});

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
        final frapatientData = await frapatientRepository.fetchPatientData();
        yield StatewiseLoaded(frapatientDataMap: frapatientData);
      } catch (error) {
        print(error);
        yield StatewiseError(error: "Data couldn't be loaded.");
      }
    }
  }
}