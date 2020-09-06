import 'pages/booking_page.dart';
import 'pages/search_page.dart';
import 'pages/create_trip_page.dart';
import 'pages/my_message_page.dart';
import 'pages/my_account_page.dart';
import 'pages/main_screen.dart';
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
  TabNavigatorRoutes.booking: BookingPage(),
  TabNavigatorRoutes.search: SearchPage(),
  TabNavigatorRoutes.createTrip: CreateTripPage(),
  TabNavigatorRoutes.myMessage: MyMessagePage(),
  TabNavigatorRoutes.myAccount: MyAccountPage()
};

List<Widget> routes = _routes.values.toList();
