import 'package:flutter/material.dart';
import '../navigation_bar.dart';

class CreateTripPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [Text('Search page')],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
