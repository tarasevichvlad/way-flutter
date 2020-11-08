import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way/utils/constants.dart';

class TripEmptyList extends StatelessWidget {
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
            style: Constants.getDefaultStyle(30),
          ),
          Text(
            "у Вас нет ${this.text}",
            style: Constants.getDefaultStyle(30),
          ),
          Text(
            "бронирований",
            style: Constants.getDefaultStyle(30),
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
