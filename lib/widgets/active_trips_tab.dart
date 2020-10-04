import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/trip/trip_bloc.dart';
import 'package:way/blocs/trip/trip_event.dart';
import 'package:way/blocs/trip/trip_state.dart';
import 'package:way/widgets/trip_empty_list.dart';
import 'package:way/widgets/trip_failure_list.dart';
import 'package:way/widgets/trip_list.dart';

import 'loading.dart';

class ActiveTripsTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActiveTripsTabState();

}

class _ActiveTripsTabState extends State<ActiveTripsTab> {
  final _scrollController = ScrollController();
  TripBloc _tripBloc;

  @override
  void initState() {
    super.initState();
    _tripBloc = BlocProvider.of<TripBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: BlocBuilder<TripBloc, TripState>(
        builder: (context, state) {
          if (state is TripInitial) {
            return Loading();
          }

          if (state is TripFailure) {
            return TripFailureList(_tripBloc);
          }

          if (state is TripSuccess) {
            if (state.trips.isEmpty) {
              return TripEmptyList("Активных");
            }

            return TripList(state.trips, _tripBloc, _scrollController, TripActive());
          }

          return Center(
            child: Text('error'),
          );
        },
      ),
    );
  }
}