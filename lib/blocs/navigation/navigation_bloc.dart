import 'package:bloc/bloc.dart';
import 'package:way/blocs/navigation/navigation_event.dart';
import 'package:way/blocs/navigation/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final NavigationState tripDefaultState;

  NavigationBloc(this.tripDefaultState) : super(tripDefaultState);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    try {
      if (event is NavigationStart) {
        yield NavigationSuccess(pathTo: event.pathTo);
      }

      if (event is NavigationToTrips) {
        yield NavigationSuccess(pathTo: event.pathTo);
      }
    } catch (_) {
      yield NavigationFailure();
    }
  }
}
