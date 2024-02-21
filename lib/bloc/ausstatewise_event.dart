part of 'ausstatewise_bloc.dart';


abstract class StatewiseEvent {
  const StatewiseEvent();
}

class GetAusPatientData extends StatewiseEvent {
  const GetAusPatientData();
}