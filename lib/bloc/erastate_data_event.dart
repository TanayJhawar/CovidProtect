part of 'erastate_data_bloc.dart';


abstract class StateDataEvent {
  const StateDataEvent();
}

class GetStatePatientData extends StateDataEvent {
  final String stateCode;
  const GetStatePatientData({@required this.stateCode});
}