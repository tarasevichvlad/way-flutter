import 'package:flutter/material.dart';
import '../navigation_bar.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(),
      body: Row(
        children: [Text('trip page')],
      ),
    );
  }
}
