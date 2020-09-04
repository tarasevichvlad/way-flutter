import 'package:flutter/material.dart';
import '../navigation_bar.dart';

class MyMessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [Text('my message page')],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
