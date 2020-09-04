import 'package:flutter/material.dart';
import '../navigation_bar.dart';

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [Text('my account page')],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
