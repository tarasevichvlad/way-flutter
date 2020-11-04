import 'package:flutter/material.dart';

class CreateTripScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () {
              /*if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  final DateTime dateToServer = DateTime.utc(_date.year,
                      _date.month, _date.day, _time.hour, _time.minute);
                  SearchTrip searchTrip = SearchTrip(
                      from: _from,
                      to: _to,
                      seats: _seats,
                      dateTime: dateToServer.toIso8601String(),
                      onlyTwo: _onlyTwo);
                  BlocProvider.of<TripBloc>(context)
                      .add(TripSearchRequested(searchTrip: searchTrip));
                } else {
                  setState(() {
                    _autoValidate = true;
                  });
                }*/
            },
            color: Color.fromRGBO(245, 245, 243, 1),
            child: Container(
              width: 330,
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text('Создать',
                    style: TextStyle(
                        color: Color.fromRGBO(18, 97, 107, 1),
                        fontFamily: 'ComicSansMS',
                        fontSize: 18)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
