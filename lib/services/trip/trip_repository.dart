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
}
