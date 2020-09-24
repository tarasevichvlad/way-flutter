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
  var _lastRequestedTime = DateTime.now();
  TripBloc _tripBloc;

  static const TextStyle textStyleBaseTheme = TextStyle(
      fontFamily: 'ComicSansMS',
      fontSize: 30,
      color: Colors.grey,);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
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
            child: Text('Упс что то пошло не так'),
          );
        }

        if (state is TripSuccess) {
          if (state.trips.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("На данный момент", style: textStyleBaseTheme,),
                  Text("у Вас нет активных", style: textStyleBaseTheme,),
                  Text("бронирований", style: textStyleBaseTheme,),
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

          print(state.trips);

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
    final currentScroll = _scrollController.position.pixels;
    final availableToHttp = DateTime.now().difference(_lastRequestedTime).inSeconds > 1;
    if ( availableToHttp && currentScroll <= -130) {
      _lastRequestedTime = DateTime.now();
      _tripBloc.add(TripFetched());
    }
  }
}