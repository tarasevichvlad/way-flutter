import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import './routes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), routes: routes);
  }
}
