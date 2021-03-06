import 'package:way/models/create_trip.dart';
import 'package:way/models/search_trip.dart';
import 'trip_api_provider.dart';
import '../../models/trip.dart';

class TripRepository {
  TripProvider _tripProvider = TripProvider();

  Future<List<Trip>> getActiveTrips() => _tripProvider.getActiveTrips();
  Future<List<Trip>> getFinishedTrips() => _tripProvider.getFinishedTrips();
  Future<List<Trip>> getMyTrips() => _tripProvider.getMyTrips();
  Future<List<Trip>> searchTrips(SearchTrip data) =>
      _tripProvider.searchTrip(data);
  Future<Null> createTrip(CreateTrip data) => _tripProvider.createTrip(data);
  Future<Trip> getTripById(String tripId) => _tripProvider.getTripById(tripId);
  Future<Null> bookingTripById(String tripId) =>
      _tripProvider.bookingTripById(tripId);
}
