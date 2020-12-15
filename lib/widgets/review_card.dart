import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way/models/review.dart';
import 'package:way/utils/constants.dart';

class ReviewCard extends StatelessWidget {
  Review review;

  ReviewCard({this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Constants.greyColor,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
            child: SizedBox(
              height: 30,
              child: Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Constants.baseColor,
                    size: 40.0,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(this.review.from.getFullName(),
                        style: Constants.getDefaultStyle(14)),
                  )),
                  Icon(
                    Icons.star,
                    color: Constants.baseColor,
                    size: 20.0,
                  ),
                  Text(this.review.rating.toString(),
                      style: Constants.getDefaultStyle(14))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: Wrap(
              children: [Text(this.review.body, style: Constants.textStyle14)],
            ),
          )
        ],
      ),
    );
  }
}
