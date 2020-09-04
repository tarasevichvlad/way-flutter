import 'package:flutter/material.dart';
import '../navigation_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Найди новое место, путешествия и людей',
                style: TextStyle(color: Colors.grey),
              ),
              Image.asset('assets/images/home_bg.jpg')
            ],
          )),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
