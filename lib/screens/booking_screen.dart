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
  TripBloc _tripBloc;

  static const TextStyle textStyleBaseTheme = TextStyle(
    fontFamily: 'ComicSansMS',
    fontSize: 30,
    color: Colors.grey,
  );

  @override
  void initState() {
    super.initState();
    _tripBloc = BlocProvider.of<TripBloc>(context);
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
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Упс что то пошло не так"),
              RaisedButton(
                  child: Text("Попробовать еще раз"),
                  onPressed: () {
                    _tripBloc.add(TripFetched());
                  })
            ],
          ));
        }

       if (state is TripSuccess) {
          if (state.trips.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "На данный момент",
                    style: textStyleBaseTheme,
                  ),
                  Text(
                    "у Вас нет активных",
                    style: textStyleBaseTheme,
                  ),
                  Text(
                    "бронирований",
                    style: textStyleBaseTheme,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 42),
                    child: Image.asset(
                      'assets/images/booking.jpg',
                      width: 341,
                      height: 400,
                    ),
                  )
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              _tripBloc.add(TripFetched());
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return index < state.trips.length
                    ? TripCard(trip: state.trips[index])
                    : Text("");
              },
              padding: const EdgeInsets.only(left: 15, right: 15),
              itemCount: state.trips.length,
              controller: _scrollController,
            ),
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
}
