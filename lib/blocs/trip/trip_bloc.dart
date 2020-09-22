import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:way/services/trip_repository.dart';

import '../blocs.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository tripRepository;

  TripBloc({@required this.tripRepository}) : super(TripInitial());

  @override
  Stream<TripState> mapEventToState(TripEvent event) async* {
    if (event is TripInitial) {
      try {
        final trips = await tripRepository.getAllTrip();
        yield TripSuccess(trips: trips);
      } catch (_) {
        yield TripFailure();
      }
    }

    if (event is TripSearchRequested) {
      try {
        final trips = await tripRepository.searchTrips(event.searchTrip);
        yield TripSearchSuccess(trips: trips);
      } catch (_) {
        yield TripSearchFailure();
      }
    }
  }
}
