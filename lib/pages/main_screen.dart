import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ));
  }
}
