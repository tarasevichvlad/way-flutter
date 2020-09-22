import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/services/trip_repository.dart';
import 'blocs/blocs.dart';
import 'screens/booking_screen.dart';
import 'screens/search_screen.dart';
import 'screens/create_trip_screen.dart';
import 'screens/my_message_screen.dart';
import 'screens/my_account_screen.dart';
import 'screens/main_screen.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String booking = '/booking';
  static const String search = '/search';
  static const String createTrip = '/create-trip';
  static const String myMessage = '/my-message';
  static const String myAccount = '/my-account';
}

Map<String, Widget> _routes = {
  TabNavigatorRoutes.root: MainScreen(),
  TabNavigatorRoutes.booking: BlocProvider(create: (context) => TripBloc(tripRepository: TripRepository())..add(TripFetched()), child: BookingScreen()),
  TabNavigatorRoutes.search: SearchScreen(),
  TabNavigatorRoutes.createTrip: CreateTripScreen(),
  TabNavigatorRoutes.myMessage: MyMessageScreen(),
  TabNavigatorRoutes.myAccount: MyAccountScreen()
};

List<Widget> routes = _routes.values.toList();
