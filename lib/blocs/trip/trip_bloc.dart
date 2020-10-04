import 'package:bloc/bloc.dart';
import 'package:way/services/trip_repository.dart';

import '../blocs.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final TripRepository tripRepository;

  final TripState tripDefaultState;

  TripBloc(this.tripRepository, this.tripDefaultState) : super(tripDefaultState);

  @override
  Stream<TripState> mapEventToState(TripEvent event) async* {
    try {
      if (event is TripFetched) {
        yield TripInitial();
      }

      if(event is TripActive) {
        final trips = await tripRepository.getActiveTrip();
        yield TripSuccess(trips: trips);
      }

      if(event is TripFinished) {
        final trips = await tripRepository.getFinishedTrip();
        yield TripSuccess(trips: trips);
      }
    } catch(_){
      yield TripFailure();
    }
  }
}
