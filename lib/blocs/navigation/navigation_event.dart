import 'package:equatable/equatable.dart';
import 'package:way/models/search_trip.dart';
import 'package:way/models/trip.dart';

abstract class NavigationEvent extends Equatable {}

class NavgationStart extends NavigationEvent {
  final String pathTo;

  NavgationStart({this.pathTo}) : assert(pathTo != null);

  @override
  List<Object> get props => [pathTo];
}

class NavigationToSearchTrip extends NavigationEvent {
  final List<Trip> trips;
  final String pathTo;
  final SearchTrip searchTrips;
  NavigationToSearchTrip({this.pathTo, this.trips, this.searchTrips});

  @override
  List<Object> get props => [pathTo, trips, searchTrips];
}

class NavigationToBookingTrip extends NavigationEvent {
  final String tripId;
  final String pathTo;
  NavigationToBookingTrip({this.pathTo, this.tripId});

  @override
  List<Object> get props => [pathTo, tripId];
}

class NavgationMainStart extends NavigationEvent {
  final String pathTo;

  NavgationMainStart({this.pathTo}) : assert(pathTo != null);

  @override
  List<Object> get props => [pathTo];
}
