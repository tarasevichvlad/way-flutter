import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/blocs/navigation/navigation_bloc.dart';
import 'package:way/blocs/navigation/navigation_event.dart';
import 'package:way/blocs/navigation/navigation_state.dart';
import 'package:way/routes.dart';
import 'package:way/services/trip/trip_repository.dart';
import 'package:way/widgets/trip_card.dart';
import 'package:way/widgets/trip_empty_list.dart';
import 'package:way/widgets/trip_failure_list.dart';

class SearchListTripScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchListTripScreen();
}

class _SearchListTripScreen extends State<SearchListTripScreen> {
  final _scrollController = ScrollController();

  String _getSeats(int seats) {
    // TODO: update
    return Intl.plural(seats,
        zero: '$seats мест',
        one: '$seats место.',
        other: '$seats места',
        name: 'seats',
        args: [seats],
        examples: const {'seats': 3});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TripBloc(TripRepository(), TripInitial()),
        child: BlocListener<NavigationBloc, NavigationState>(
          listener: (BuildContext context, NavigationState state) {
            if (state is NavigationToSearchTripSuccess) {
              BlocProvider.of<TripBloc>(context).add(TripInitialSearch(
                  trips: state.trips, searchTrip: state.searchTrip));
            }
          },
          child: BlocBuilder<TripBloc, TripState>(
            builder: (context, state) {
              if (state is TripFailure) {
                return TripFailureList(BlocProvider.of<TripBloc>(context));
              }

              if (state is TripInitialSearchSuccess) {
                if (state.trips.isEmpty) {
                  return TripEmptyList("Активных");
                }

                String currentDate = DateFormat('yyyy-MM-dd HH:mm')
                    .format(DateTime.parse(state.searchTrip.dateTime));
                String seats = _getSeats(state.searchTrip.seats);
                String from = state.searchTrip.from;
                String to = state.searchTrip.to;
                String placeholder = '$from - $to, $currentDate, $seats';

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(10),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 24,
                          ),
                          onPressed: () {
                            BlocProvider.of<NavigationBloc>(context).add(
                                NavgationStart(
                                    pathTo: TabNavigatorRoutes.search));
                          },
                        ),
                        Container(
                          width: 320,
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 245, 243, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: Padding(
                            child: Text(
                              placeholder,
                              style: TextStyle(
                                  color: Color.fromRGBO(18, 97, 107, 1),
                                  fontFamily: 'ComicSansMS',
                                  fontSize: 14),
                            ),
                            padding: EdgeInsets.all(16),
                          ),
                        )
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return index < state.trips.length
                            ? TripCard(trip: state.trips[index])
                            : Text("");
                      },
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      itemCount: state.trips.length,
                      controller: _scrollController,
                    )
                  ],
                );
              }

              return Text('test');
            },
          ),
        ));
  }
}
