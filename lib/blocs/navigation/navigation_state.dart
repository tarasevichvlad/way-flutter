import 'package:equatable/equatable.dart';
import 'package:way/models/search_trip.dart';
import 'package:way/models/trip.dart';

abstract class NavigationState {
  const NavigationState();
}

class NavigationInitial extends NavigationState {}

class NavigationSuccess extends NavigationState {
  final String pathTo;
  NavigationSuccess({this.pathTo});
}

class NavigationFailure extends NavigationState {}

class NavigationToSearchTripSuccess extends NavigationState {
  final List<Trip> trips;
  final String pathTo;
  final SearchTrip searchTrip;
  NavigationToSearchTripSuccess({this.pathTo, this.trips, this.searchTrip});
}

class NavigationToBookingTripSuccess extends NavigationState {
  final String tripId;
  final String pathTo;
  NavigationToBookingTripSuccess({this.pathTo, this.tripId});
}
