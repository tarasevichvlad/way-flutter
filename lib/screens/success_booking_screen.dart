import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/navigation/navigation_bloc.dart';
import 'package:way/blocs/navigation/navigation_event.dart';
import 'package:way/routes.dart';

class SuccessBookingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SuccessBookingScreen();
}

class _SuccessBookingScreen extends State<SuccessBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 70),
                child: Text(
                  'В добрый путь!',
                  style: TextStyle(
                      color: Color.fromRGBO(18, 97, 107, 1),
                      fontFamily: 'ComicSansMS',
                      fontSize: 28),
                ),
              ),
              Image.asset('assets/images/success.png')
            ],
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(bottom: 20),
            child: FlatButton(
              onPressed: () {
                BlocProvider.of<NavigationBloc>(context).add(
                    NavgationMainStart(pathTo: TabNavigatorRoutes.booking));
              },
              color: Color.fromRGBO(245, 245, 243, 1),
              child: Container(
                width: 330,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text('Продолжить',
                      style: TextStyle(
                          color: Color.fromRGBO(18, 97, 107, 1),
                          fontFamily: 'ComicSansMS',
                          fontSize: 18)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
