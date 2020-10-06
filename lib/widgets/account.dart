import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/user/user_bloc.dart';
import 'package:way/blocs/user/user_event.dart';
import 'package:way/blocs/user/user_state.dart';
import 'package:way/utils/constants.dart';

import 'loading.dart';
import 'review_list.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  static const TextStyle textStyle = TextStyle(
      fontFamily: 'Comic Sans MS',
      fontSize: 18,
      color: const Color(0xff12616a));

  static const TextStyle textStyle1 = TextStyle(
      fontFamily: 'Comic Sans MS',
      fontSize: 16,
      color: const Color(0xff12616a));

  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return Loading();
        }

        if (state is UserReviewsSuccess) {
          return ReviewList(userBloc: this._userBloc, user: state.user);
        }

        if (state is UserSuccess) {

          return Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 245, 243, 100),
                    borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Icon(
                          Icons.account_circle,
                          color: Constants.baseColor,
                          size: 80.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          state.user.getFullName(),
                          style: textStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Constants.baseColor,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Constants.baseColor,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Constants.baseColor,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Constants.baseColor,
                            size: 30.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Constants.baseColor,
                            size: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              state.user.rating.toString(),
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 50,
                        thickness: 0.5,
                        indent: 70,
                        endIndent: 70,
                      ),
                      Container(
                        height: 70,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print("The place for navigate to trips");
                              },
                              child: Column(children: [
                                Text(state.user.tripCount.toString(), style: textStyle1),
                                SizedBox(height: 5),
                                Text("Поездок", style: textStyle1)
                              ]),
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              thickness: 0.5,
                              width: 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                _userBloc.add(UserReviewFetched());
                              },
                              child: Column(
                                children: [
                                  Text(state.user.reviews.length.toString(), style: textStyle1),
                                  SizedBox(height: 5),
                                  Text("Отзывов", style: textStyle1)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Constants.greyColor,
                    borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_iphone,
                        color: Constants.baseColor,
                        size: 30.0,
                      ),
                      Text(state.user.phone ?? "Телефон не указан")
                    ],
                  ),
                ),
              )
            ],
          );
        }

        return Center(
          child: Text('error'),
        );
      },
    );
  }
}
