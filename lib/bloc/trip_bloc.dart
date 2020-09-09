import 'package:bloc/bloc.dart';
import 'package:way/bloc/trip_event.dart';
import 'package:way/bloc/trip_state.dart';
import 'package:way/models/trip.dart';
import 'package:way/services/trip_repository.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository tripRepository;

  TripBloc({this.tripRepository}) : super(TripEmptyState());

  @override
  Stream<TripState> mapEventToState(TripEvent event) async* {
    if (event is TripLoadEvent) {
      yield TripLoadingState();
      try {
        final List<Trip> _loadedTrips = await tripRepository.getAllTrip();
        yield TripLoadedState(loadedTrips: _loadedTrips);
      } catch (_) {
        yield TripEmptyState();
      }
    }
  }
}
