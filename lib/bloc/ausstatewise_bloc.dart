import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakecblue/data/repos/auspatientrepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'ausstatewise_event.dart';
part 'ausstatewise_state.dart';

class StatewiseBloc extends Bloc<StatewiseEvent, StatewiseState> {
  final AusPatientRepository auspatientRepository;

  StatewiseBloc({this.auspatientRepository});

  @override
  StatewiseState get initialState => StatewiseInitial();

  @override
  Stream<StatewiseState> mapEventToState(
      StatewiseEvent event,
      ) async* {
    // TODO: implement mapEventToState
    yield StatewiseLoading();
    if (event is GetAusPatientData) {
      try {
        final auspatientData = await auspatientRepository.fetchPatientData();
        yield StatewiseLoaded(auspatientDataMap: auspatientData);
      } catch (error) {
        print(error);
        yield StatewiseError(error: "Data couldn't be loaded.");
      }
    }
  }
}