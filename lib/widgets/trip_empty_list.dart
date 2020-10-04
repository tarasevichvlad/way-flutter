import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripEmptyList extends StatelessWidget {
  static const TextStyle textStyleBaseTheme = TextStyle(
    fontFamily: 'ComicSansMS',
    fontSize: 30,
    color: Colors.grey,
  );

  String text;
  TripEmptyList(String text) {
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "На данный момент",
            style: textStyleBaseTheme,
          ),
          Text(
            "у Вас нет ${this.text}",
            style: textStyleBaseTheme,
          ),
          Text(
            "бронирований",
            style: textStyleBaseTheme,
          ),
          Padding(
            padding: EdgeInsets.only(top: 42),
            child: Image.asset(
              'assets/images/booking.jpg',
              width: 341,
              height: 400,
            ),
          )
        ],
      ),
    );
  }

}