import 'package:way/models/search_trip.dart';
import 'package:way/models/trip.dart';

abstract class TripState {
  const TripState();
}

class TripInitial extends TripState {}

class TripFailure extends TripState {}

class TripSuccess extends TripState {
  List<Trip> trips;

  TripSuccess({this.trips}) {
    trips = this.trips ?? List<Trip>();
  }

  TripSuccess copyWith({List<Trip> trips, bool hasReachedMax}) {
    return TripSuccess(
      trips: trips ?? this.trips,
    );
  }

  @override
  String toString() => 'TripSuccess { trips: ${trips.length} }';
}

class TripSearch extends TripState {}

class TripSearchSuccess extends TripState {
  final List<Trip> trips;
  final SearchTrip searchTrip;

  const TripSearchSuccess({this.trips, this.searchTrip});
}

class TripSearchFailure extends TripState {}

class TripInitialSearchSuccess extends TripState {
  List<Trip> trips;
  final SearchTrip searchTrip;

  TripInitialSearchSuccess({this.trips, this.searchTrip}) {
    trips = this.trips ?? List<Trip>();
  }
}

class TripCreateSuccess extends TripState {}

class TripCreateFailure extends TripState {}

class TripInfoSuccess extends TripState {
  Trip trip;

  TripInfoSuccess({this.trip});
}

class TripInfoFailure extends TripState {}

class BookingByIdSuccess extends TripState {}

class BookingByIdFailure extends TripState {}
