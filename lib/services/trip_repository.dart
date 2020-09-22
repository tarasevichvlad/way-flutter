import 'trip_api_provider.dart';
import '../models/trip.dart';

class TripRepository {
  TripProvider _tripProvider = TripProvider();

  Future<List<Trip>> getAllTrip() => _tripProvider.getTrips();
}
