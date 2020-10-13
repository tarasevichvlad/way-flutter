import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way/blocs/user/user_bloc.dart';
import 'package:way/blocs/user/user_event.dart';

import 'package:way/models/user.dart';
import 'package:way/utils/constants.dart';

import 'review_card.dart';

class ReviewList extends StatelessWidget {
  final User user;
  UserBloc userBloc;
  final ScrollController scrollController = ScrollController();

  ReviewList({this.user, this.userBloc});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Constants.whiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: GestureDetector(
              onTap: () { userBloc.add(UserFetched()); },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Constants.baseColor,
                    size: 30.0,
                  ),
                  Text("Назад", style: Constants.textStyle14,)
                ],
              ),
            ),
          ),
          if (this.user.reviews.length > 0)
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  return this.userBloc.add(UserReviewFetched());
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return index < user.reviews.length
                        ? ReviewCard(review: user.reviews[index])
                        : Text("");
                  },
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  itemCount: user.reviews.length,
                  controller: scrollController,
                ),
              ),
            )
          else
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Wrap(children: [
                      Text(
                        "На данный момент у Вас нет отзывов",
                        style: Constants.textStyle30,
                        textAlign: TextAlign.center,
                      )
                    ]),
                  ),
                  Image.asset(
                    'assets/images/review.jpg',
                    width: 341,
                    height: 400,
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
