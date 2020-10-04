import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:way/blocs/blocs.dart';

class TripFailureList extends StatelessWidget {
  TripBloc tripBloc;

  TripFailureList(tripBloc) {
    this.tripBloc = tripBloc;
  }

  @override
  Widget build(BuildContext context ) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Упс что то пошло не так"),
            RaisedButton(
                child: Text("Попробовать еще раз"),
                onPressed: () {
                  this.tripBloc.add(TripFetched());
                  this.tripBloc.add(TripActive());
                })
          ],
        ));
  }

}