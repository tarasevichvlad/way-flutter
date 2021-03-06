import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/screens/search_list_trip_screen.dart';
import 'package:way/screens/search_trip_info_screen.dart';
import 'package:way/screens/success_booking_screen.dart';
import 'package:way/services/trip/trip_repository.dart';

import 'blocs/trip/trip_bloc.dart';
import 'blocs/trip/trip_state.dart';
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

class NestedRoutes {
  static const String searchListTrip = '/search-list-trip';
  static const String searchTripInfo = '/search-trip-info';
  static const String searchTripSuccessBooking = '/search-trip-success-booking';
}

Map<String, Widget> _routes = {
  TabNavigatorRoutes.root: MainScreen(),
  TabNavigatorRoutes.booking: BookingScreen(),
  TabNavigatorRoutes.search: BlocProvider(
      create: (context) => TripBloc(TripRepository(), TripInitial()),
      child: SearchScreen()),
  TabNavigatorRoutes.createTrip: BlocProvider(
      create: (context) => TripBloc(TripRepository(), TripInitial()),
      child: CreateTripScreen()),
  TabNavigatorRoutes.myMessage: MyMessageScreen(),
  TabNavigatorRoutes.myAccount: MyAccountScreen(),
  NestedRoutes.searchListTrip: SearchListTripScreen(),
  NestedRoutes.searchTripInfo: SearchTripInfoScreen(),
  NestedRoutes.searchTripSuccessBooking: SuccessBookingScreen()
};

List<Widget> routes = _routes.values.toList();
List<MapEntry<String, Widget>> allRoutes = _routes.entries.toList();
