import 'trip_api_provider.dart';
import '../models/trip.dart';

class TripRepository {
  TripProvider _tripProvider = TripProvider();

  Future<List<Trip>> getActiveTrip() => _tripProvider.getActiveTrips();
  Future<List<Trip>> getFinishedTrip() => _tripProvider.getFinishedTrips();
}
