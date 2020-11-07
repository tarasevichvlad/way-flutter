import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/blocs/navigation/navigation_bloc.dart';
import 'package:way/blocs/navigation/navigation_event.dart';
import 'package:way/blocs/navigation/navigation_state.dart';
import 'package:way/routes.dart';
import 'package:way/search_icons.dart';
import 'package:way/services/trip/trip_repository.dart';

class SearchTripInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchTripInfoScreen();
}

class _SearchTripInfoScreen extends State<SearchTripInfoScreen> {
  TextStyle _defaultTextStyle = TextStyle(
      color: Color.fromRGBO(18, 97, 107, 1),
      fontFamily: 'ComicSansMS',
      fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TripBloc(TripRepository(), TripInitial()),
        child: BlocListener<NavigationBloc, NavigationState>(
            listener: (BuildContext context, NavigationState state) {
              if (state is NavigationToBookingTripSuccess) {
                BlocProvider.of<TripBloc>(context)
                    .add(GetTripInfo(tripId: state.tripId));
              }
            },
            child: BlocListener<TripBloc, TripState>(
              listener: (BuildContext context, TripState state) {
                if (state is BookingByIdSuccess) {
                  BlocProvider.of<NavigationBloc>(context).add(NavgationStart(
                      pathTo: NestedRoutes.searchTripSuccessBooking));
                }
              },
              child: BlocBuilder<TripBloc, TripState>(
                builder: (context, state) {
                  if (state is TripInfoSuccess) {
                    final startDate =
                        DateFormat('MMMMd').format(state.trip.startingTime);
                    final startTime =
                        DateFormat('jm').format(state.trip.startingTime);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/info.png'),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 245, 245, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                          margin: EdgeInsets.fromLTRB(24, 3, 24, 3),
                          child: Column(
                            children: [
                              Text(
                                state.trip.driver.getFullName(),
                                style: TextStyle(
                                    color: Color.fromRGBO(18, 97, 107, 1),
                                    fontFamily: 'ComicSansMS',
                                    fontSize: 22),
                              ),
                              Text(
                                "Маршрут: ${state.trip.from} - ${state.trip.to}",
                                style: TextStyle(
                                    color: Color.fromRGBO(18, 97, 107, 1),
                                    fontFamily: 'ComicSansMS',
                                    fontSize: 18),
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: Row(
                                    children: [
                                      Icon(
                                        SearchIcons.calendar_outlilne,
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Opacity(
                                          opacity: 0.6,
                                          child: Text(
                                            "Дата выезда ${startDate}",
                                            style: _defaultTextStyle,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    children: [
                                      Icon(
                                        SearchIcons.clock,
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Opacity(
                                          opacity: 0.6,
                                          child: Text(
                                            "Время ${startTime}",
                                            style: _defaultTextStyle,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    children: [
                                      Icon(
                                        SearchIcons.airline_seat_recline_normal,
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Opacity(
                                          opacity: 0.6,
                                          child: Text(
                                            "Количество пассажиров (${state.trip.passengers.length})",
                                            style: _defaultTextStyle,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.local_offer,
                                      color: Color.fromRGBO(18, 97, 107, 1),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Opacity(
                                        opacity: 0.6,
                                        child: Text(
                                          "Стоимость (${state.trip.price} рублей)",
                                          style: _defaultTextStyle,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 12),
                                      child: Icon(
                                        SearchIcons.users,
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                      ),
                                    ),
                                    Container(
                                      width: 250,
                                      padding: EdgeInsets.only(left: 20),
                                      margin: EdgeInsets.all(0),
                                      child: Opacity(
                                          opacity: 0.6,
                                          child: SwitchListTile(
                                            title: Text(
                                              'Сзади только двое?',
                                              style: _defaultTextStyle,
                                            ),
                                            contentPadding: EdgeInsets.all(0),
                                            value: state.trip.onlyTwoBehind,
                                            onChanged: (state) {},
                                            inactiveThumbColor:
                                                Color.fromRGBO(18, 97, 107, 1),
                                            activeColor:
                                                Color.fromRGBO(18, 97, 107, 1),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 245, 245, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
                          margin: EdgeInsets.all(12),
                          height: 127,
                          width: 360,
                          child: Text(
                            state.trip.comment,
                            style: _defaultTextStyle,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            BlocProvider.of<TripBloc>(context)
                                .add(BookingById(tripId: state.trip.id));
                          },
                          color: Color.fromRGBO(245, 245, 243, 1),
                          child: Container(
                            width: 330,
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text('Забронировать',
                                  style: TextStyle(
                                      color: Color.fromRGBO(18, 97, 107, 1),
                                      fontFamily: 'ComicSansMS',
                                      fontSize: 18)),
                            ),
                          ),
                        )
                      ],
                    );
                  }

                  return Text("Empty");
                },
              ),
            )));
  }
}
