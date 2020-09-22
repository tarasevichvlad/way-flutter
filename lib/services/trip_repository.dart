import 'package:way/models/search_trip.dart';

import 'trip_api_provider.dart';
import '../models/trip.dart';

class TripRepository {
  TripProvider _tripProvider = TripProvider();

  Future<List<Trip>> getAllTrip() => _tripProvider.getTrips();
  Future<List<Trip>> searchTrips(SearchTrip data) =>
      _tripProvider.searchTrip(data);
}
