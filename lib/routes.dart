import 'pages/booking_page.dart';
import 'pages/search_page.dart';
import 'pages/create_trip_page.dart';
import 'pages/my_message_page.dart';
import 'pages/my_account_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/booking': (context) => BookingPage(),
  '/search': (context) => SearchPage(),
  '/create-trip': (context) => CreateTripPage(),
  '/my-message': (context) => MyMessagePage(),
  '/my-account': (context) => MyAccountPage()
};

List<String> routePath = [
  '/booking',
  '/search',
  '/create-trip',
  '/my-message',
  '/my-account'
];
