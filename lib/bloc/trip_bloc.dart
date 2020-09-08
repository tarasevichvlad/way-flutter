import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/bloc/trip_event.dart';
import 'package:way/bloc/trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  @override
  get initialState => {};

  @override
  Stream mapEventToState(event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
