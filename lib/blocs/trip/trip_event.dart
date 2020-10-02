import 'package:equatable/equatable.dart';

abstract class TripEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TripFetched extends TripEvent {}
class TripReFetched extends TripEvent {}
