import 'package:flutter/material.dart';
import '../navigation_bar.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [Text('Booking page')],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
