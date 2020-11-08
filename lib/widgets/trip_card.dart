import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:way/models/trip.dart';
import 'package:way/utils/constants.dart';

class TripCard extends StatelessWidget {
  final Trip trip;
  static const TextStyle textStyleWhite =
      TextStyle(fontFamily: 'Comic Sans MS', fontSize: 18, color: Colors.white);
  static const TextPaddingTop = const EdgeInsets.only(left: 3, right: 3);
  static const TextPaddingBottom =
      const EdgeInsets.only(left: 3, right: 3, top: 22);

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
                    color: Constants.baseColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, top: 9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                        child: Stack(
                          children: [
                            Padding(
                              padding: TextPaddingTop,
                              child: Text(
                                '${trip.getStartDate()}',
                                style: textStyleWhite,
                              ),
                            ),
                            Padding(
                              padding: TextPaddingBottom,
                              child: Text(
                                '${trip.getFinishDate()}',
                                style: textStyleWhite,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 60,
                          child: Stack(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 4),
                                  child: Icon(
                                    Icons.brightness_1,
                                    color: Constants.whiteColor,
                                    size: 14.0,
                                  ) //SvgPicture.string(circle),
                                  ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 26),
                                child: Icon(
                                  Icons.brightness_1,
                                  color: Constants.whiteColor,
                                  size: 14.0,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                          height: 60,
                          child: Stack(
                            children: [
                              Padding(
                                padding: TextPaddingTop,
                                child: Text(
                                  '${trip.from}',
                                  style: textStyleWhite,
                                ),
                              ),
                              Padding(
                                padding: TextPaddingBottom,
                                child: Text(
                                  '${trip.to}',
                                  style: textStyleWhite,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 60,
            child: Container(
              decoration: BoxDecoration(
                  color: Constants.greyColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Constants.baseColor,
                      size: 45.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${trip.driver.getFullName()}',
                            style: Constants.getDefaultStyle(18),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Constants.baseColor,
                                size: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Text(
                                  "${trip.driver.rating}",
                                  style: Constants.getDefaultStyle(18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Icon(
                                  Icons.work,
                                  color: Constants.baseColor,
                                  size: 20.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Text(
                                  "${trip.price}р",
                                  style: Constants.getDefaultStyle(18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Icon(
                                  Icons.event_seat,
                                  color: Constants.baseColor,
                                  size: 20.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Text(
                                  "${trip.seats - trip.passengers.length}",
                                  style: Constants.getDefaultStyle(18),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    trip.onlyTwoBehind
                        ? Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: Icon(
                              Icons.people_outline,
                              color: Constants.baseColor,
                              size: 45.0,
                            ),
                          )
                        : Container(width: 45)
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
