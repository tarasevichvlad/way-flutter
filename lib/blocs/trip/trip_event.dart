import 'package:equatable/equatable.dart';
import 'package:way/models/search_trip.dart';
import 'package:way/models/trip.dart';

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

class TripActive extends TripEvent {}

class TripFinished extends TripEvent {}

class TripInitialSearch extends TripEvent {
  final List<Trip> trips;
  final SearchTrip searchTrip;
  TripInitialSearch({this.trips, this.searchTrip});

  @override
  List<Object> get props => [trips, searchTrip];
}
