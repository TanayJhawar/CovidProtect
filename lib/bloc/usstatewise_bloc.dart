import 'dart:async';


import 'package:sakecblue/data/repos/uspatientrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'usstatewise_event.dart';
part 'usstatewise_state.dart';

class StatewiseBloc extends Bloc<StatewiseEvent, StatewiseState> {
  final UsPatientRepository uspatientRepository;

  StatewiseBloc({this.uspatientRepository});

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
        final uspatientData = await uspatientRepository.fetchPatientData();
        yield StatewiseLoaded(uspatientDataMap: uspatientData);
      } catch (error) {
        print(error);
        yield StatewiseError(error: "Data couldn't be loaded.");
      }
    }
  }
}
