import 'package:bloc/bloc.dart';
import 'package:way/services/trip/trip_repository.dart';

import '../blocs.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository tripRepository;

  final TripState tripDefaultState;

  TripBloc(this.tripRepository, this.tripDefaultState)
      : super(tripDefaultState);

  @override
  Stream<TripState> mapEventToState(TripEvent event) async* {
    try {
      if (event is TripFetched) {
        yield TripInitial();
      }

      if (event is TripActive) {
        final trips = await tripRepository.getActiveTrips();
        yield TripSuccess(trips: trips);
      }

      if (event is TripFinished) {
        final trips = await tripRepository.getFinishedTrips();
        yield TripSuccess(trips: trips);
      }

      if (event is TripSearchRequested) {
        try {
          final trips = await tripRepository.searchTrips(event.searchTrip);
          yield TripSearchSuccess(trips: trips, searchTrip: event.searchTrip);
        } catch (_) {
          yield TripSearchFailure();
        }
      }

      if (event is TripCreateRequested) {
        try {
          await tripRepository.createTrip(event.createTrip);
          yield TripCreateSuccess();
        } catch (_) {
          yield TripCreateFailure();
        }
      }

      if (event is TripInitialSearch) {
        yield TripInitialSearchSuccess(
            trips: event.trips, searchTrip: event.searchTrip);
      }

      if (event is GetTripInfo) {
        try {
          final trip = await tripRepository.getTripById(event.tripId);
          yield TripInfoSuccess(trip: trip);
        } catch (_) {
          yield TripInfoFailure();
        }
      }

      if (event is BookingById) {
        try {
          await tripRepository.bookingTripById(event.tripId);
          yield BookingByIdSuccess();
        } catch (_) {
          yield BookingByIdFailure();
        }
      }
    } catch (_) {
      yield TripFailure();
    }
  }
}
