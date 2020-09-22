import 'package:equatable/equatable.dart';
import 'package:way/models/search_trip.dart';

abstract class TripEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TripFetched extends TripEvent {}

class TripSearchRequested extends TripEvent {
  final SearchTrip searchTrip;

  TripSearchRequested({this.searchTrip}) : assert(searchTrip != null);

  @override
  List<Object> get props => [searchTrip];
}
