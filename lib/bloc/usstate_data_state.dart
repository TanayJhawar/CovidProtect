part of 'usstate_data_bloc.dart';

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
  final Map<String, List<UsMyStateSingleValue>> uspatientDataMap;
  const StateDataLoaded({this.uspatientDataMap});
}

class StateDataError extends StateDataState {
  final String error;
  const StateDataError({this.error});
}



