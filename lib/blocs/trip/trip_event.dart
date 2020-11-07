import 'package:way/models/create_trip.dart';
import 'package:way/models/search_trip.dart';
import 'package:way/models/trip.dart';

abstract class TripEvent {}

class TripFetched extends TripEvent {}

class TripSearchRequested extends TripEvent {
  final SearchTrip searchTrip;

  TripSearchRequested({this.searchTrip}) : assert(searchTrip != null);
}

class TripActive extends TripEvent {}

class TripFinished extends TripEvent {}

class TripInitialSearch extends TripEvent {
  final List<Trip> trips;
  final SearchTrip searchTrip;
  TripInitialSearch({this.trips, this.searchTrip});
}

class TripCreateRequested extends TripEvent {
  final CreateTrip createTrip;

  TripCreateRequested({this.createTrip}) : assert(createTrip != null);
}

class GetTripInfo extends TripEvent {
  final String tripId;
  GetTripInfo({this.tripId});
}
