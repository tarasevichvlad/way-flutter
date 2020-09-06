import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Найди новое место,',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'ComicSansMS',
                      fontSize: 30),
                ),
                Text(
                  'путешествия',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'ComicSansMS',
                      fontSize: 30),
                ),
                Text(
                  'и людей',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'ComicSansMS',
                      fontSize: 30),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 42),
                  child: Image.asset(
                    'assets/images/home_bg.jpg',
                    width: 341,
                    height: 440,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
