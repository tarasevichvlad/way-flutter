import 'package:flutter/material.dart';
import 'booking_card.dart';

class BookingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                    child: ListTile(
                      title: BookingCard(),
                    ),
                  ))
        ],
      ),
    );
  }
}
