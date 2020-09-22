import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:way/models/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  static const TextStyle textStyleWhite =
      TextStyle(fontFamily: 'Comic Sans MS', fontSize: 16, color: Colors.white);

  static const TextStyle textStyleBaseTheme = TextStyle(
      fontFamily: 'Comic Sans MS',
      fontSize: 16,
      color: const Color(0xff12616a));

  TripCard({@required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff12616a),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${trip.startingTime}',
                            style: textStyleWhite,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: SvgPicture.string(circle),
                          ),
                          Text(
                            '${trip.from}',
                            style: textStyleWhite,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${trip.finishTime}',
                            style: textStyleWhite,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            child: SvgPicture.string(circle),
                          ),
                          Text(
                            '${trip.to}',
                            style: textStyleWhite,
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 60,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 243, 100),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: const Color(0xff12616a),
                      size: 45.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${trip.driver.firstName} ${trip.driver.lastName}',
                            style: textStyleBaseTheme,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: const Color(0xff12616a),
                                size: 20.0,
                              ),
                              Text(
                                "${trip.rating}",
                                style: textStyleBaseTheme,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Icon(
                                  Icons.local_offer,
                                  color: const Color(0xff12616a),
                                  size: 20.0,
                                ),
                              ),
                              Text(
                                "${trip.price}р",
                                style: textStyleBaseTheme,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Icon(
                                  Icons.airline_seat_recline_normal,
                                  color: const Color(0xff12616a),
                                  size: 20.0,
                                ),
                              ),
                              Text(
                                "${trip.seats - trip.passengers.length}",
                                style: textStyleBaseTheme,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    trip.onlyTwoBehind
                        ? Padding(
                            padding: const EdgeInsets.only(left: 20, right: 0),
                            child: Icon(
                              Icons.group,
                              color: const Color(0xff12616a),
                              size: 45.0,
                            ),
                          )
                        : Text("")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String circle = '<svg viewBox="0 0 30 30" color="red" xmlns="http://www.w3.org/2000/svg"> <circle cx="15" cy="15" r="6" fill="white"/> </svg>';
