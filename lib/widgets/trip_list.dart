import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/blocs/trip/trip_event.dart';
import 'package:way/models/trip.dart';
import 'package:way/widgets/trip_card.dart';

class TripList extends StatelessWidget {
  List<Trip> trips;
  TripBloc tripBloc;
  ScrollController scrollController;
  TripEvent tripEvent;

  TripList(trips, tripBloc, scrollController, tripEvent) {
    this.trips = trips;
    this.tripBloc = tripBloc;
    this.scrollController = scrollController;
    this.tripEvent = tripEvent;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return this.tripBloc.add(tripEvent);
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return index < trips.length
              ? TripCard(trip: trips[index])
              : Text("");
        },
        padding: const EdgeInsets.only(left: 15, right: 15),
        itemCount: trips.length,
        controller: scrollController,
      ),
    );
  }
}