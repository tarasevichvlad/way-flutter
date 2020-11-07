import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/blocs/navigation/navigation_bloc.dart';
import 'package:way/blocs/navigation/navigation_state.dart';
import 'package:way/services/trip/trip_repository.dart';

class SearchTripInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchTripInfoScreen();
}

class _SearchTripInfoScreen extends State<SearchTripInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TripBloc(TripRepository(), TripInitial()),
        child: BlocListener<NavigationBloc, NavigationState>(
          listener: (BuildContext context, NavigationState state) {
            if (state is NavigationToBookingTripSuccess) {
              BlocProvider.of<TripBloc>(context)
                  .add(TripInitialInfo(tripId: state.tripId));
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/info.png')],
          ),
        ));
  }
}
