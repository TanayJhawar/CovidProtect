part of 'usstatewise_bloc.dart';

@immutable
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
  final Map<String, List> uspatientDataMap;
  const StatewiseLoaded({this.uspatientDataMap});
}

class StatewiseError extends StatewiseState {
  final String error;
  const StatewiseError({this.error});
}
