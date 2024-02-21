part of 'indstate_data_bloc.dart';

@immutable
abstract class StateDataState {
  const StateDataState();
}

class StateDataInitial extends StateDataState {
  const StateDataInitial();
}

class StateDataLoading extends StateDataState {
  const StateDataLoading();
}


class StateDataLoaded extends StateDataState {
  final Map<String, List<IndMyStateSingleValue>> indpatientDataMap;
  const StateDataLoaded({this.indpatientDataMap});
}

class StateDataError extends StateDataState {
  final String error;
  const StateDataError({this.error});
}



