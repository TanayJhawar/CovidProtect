part of 'ausstatewise_bloc.dart';


abstract class StatewiseState {
  const StatewiseState();
}

class StatewiseInitial extends StatewiseState {
  const StatewiseInitial();
}

class StatewiseLoading extends StatewiseState {
  const StatewiseLoading();
}

class StatewiseLoaded extends StatewiseState {
  final Map<String, List> auspatientDataMap;
  const StatewiseLoaded({this.auspatientDataMap});
}

class StatewiseError extends StatewiseState {
  final String error;
  const StatewiseError({this.error});
}