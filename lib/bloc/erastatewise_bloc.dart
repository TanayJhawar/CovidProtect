import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakecblue/data/repos/erapatientrepository.dart';


part 'erastatewise_event.dart';
part 'erastatewise_state.dart';

class StatewiseBloc extends Bloc<StatewiseEvent, StatewiseState> {
  final EraPatientRepository erapatientRepository;

  StatewiseBloc({this.erapatientRepository});

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
        final erapatientData = await erapatientRepository.fetchPatientData();
        yield StatewiseLoaded(erapatientDataMap: erapatientData);
      } catch (error) {
        print(error);
        yield StatewiseError(error: "Data couldn't be loaded.");
      }
    }
  }
}