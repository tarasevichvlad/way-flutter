import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/widgets/trip_card.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  TripBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<TripBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripBloc, TripState>(
      builder: (context, state) {
        if (state is TripInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is TripFailure) {
          return Center(
            child: Text('failed to fetch trips'),
          );
        }

        if (state is TripSuccess) {
          if (state.trips.isEmpty) {
            return Center(
              child: Text('no trips'),
            );
          }

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {

              return index < state.trips.length ?  TripCard(trip: state.trips[index]) : Text("");
            },
            padding: const EdgeInsets.only(left: 15, right: 15),
            itemCount:state.trips.length,
            controller: _scrollController,
          );
        }

        return Center(
          child: Text('error'),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(TripFetched());
    }
  }
}