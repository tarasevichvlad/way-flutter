import 'package:flutter/material.dart';
import './home_page.dart';
import './navigation_bar.dart';
import './routes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: HomePage(),
      bottomNavigationBar: NavigationBar(),
    ), routes: routes);
  }
}
