import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/services/trip_repository.dart';
import 'booking_card.dart';

class BookingList extends StatelessWidget {
  final TripRepository tripRepository = TripRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TripBloc(tripRepository: tripRepository),
        child: Container(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => Container(
                        child: ListTile(
                          title: BookingCard(),
                        ),
                      ))
            ],
          ),
        ));
  }
}
