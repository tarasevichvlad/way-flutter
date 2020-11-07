import 'package:bloc/bloc.dart';
import 'package:way/blocs/navigation/navigation_event.dart';
import 'package:way/blocs/navigation/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final NavigationState tripDefaultState;

  NavigationBloc(this.tripDefaultState) : super(tripDefaultState);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    try {
      if (event is NavgationStart) {
        yield NavigationSuccess(pathTo: event.pathTo);
      }

      if (event is NavigationToSearchTrip) {
        yield NavigationToSearchTripSuccess(
            pathTo: event.pathTo,
            trips: event.trips,
            searchTrip: event.searchTrips);
      }

      if (event is NavigationToBookingTrip) {
        yield NavigationToBookingTripSuccess(
            pathTo: event.pathTo, tripId: event.tripId);
      }
    } catch (_) {
      yield NavigationFailure();
    }
  }
}
