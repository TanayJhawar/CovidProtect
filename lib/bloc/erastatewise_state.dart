part of 'erastatewise_bloc.dart';


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
  final Map<String, List> erapatientDataMap;
  const StatewiseLoaded({this.erapatientDataMap});
}

class StatewiseError extends StatewiseState {
  final String error;
  const StatewiseError({this.error});
}