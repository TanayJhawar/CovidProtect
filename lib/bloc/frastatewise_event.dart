part of 'frastatewise_bloc.dart';


abstract class StatewiseEvent {
  const StatewiseEvent();
}

class GetPatientData extends StatewiseEvent {
  const GetPatientData();
}