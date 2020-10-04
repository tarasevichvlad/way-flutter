import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/services/trip_repository.dart';
import 'package:way/widgets/active_trips_tab.dart';
import 'package:way/widgets/finished_trips_tab.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.amber,
          labelColor: Colors.white,
          unselectedLabelColor: const Color(0xff12616a),
          indicator: BoxDecoration(color: const Color(0xff12616a)),
          tabs: [
            Tab(text: "Активные"),
            Tab(text: "Завершенные")
          ],
        ),
        body: TabBarView(
          children: [
            BlocProvider(create: (context) => TripBloc(TripRepository(), TripInitial())..add(TripActive()), child: ActiveTripsTab()),
            BlocProvider(create: (context) => TripBloc(TripRepository(), TripInitial())..add(TripFinished()), child: FinishedTripsTab()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
