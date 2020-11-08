import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/blocs/trip/trip_bloc.dart';
import 'package:way/models/create_trip.dart';
import 'package:way/utils/constants.dart';
import 'package:way/widgets/search_form.dart';

class CreateTripScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTripScreen> {
  final _formKey = GlobalKey<FormState>();
  TripModel model;
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final form = SearchForm(
      autovalidate: autoValidate, // TODO: invstigate
      formKey: _formKey,
      onSaved: (TripModel data) {
        model = data;
      },
      isCreateMode: true,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          child: TextFormField(
            onSaved: (String val) {
              model.comment = val;
            },
            maxLines: 3,
            decoration: InputDecoration.collapsed(
                hintText: "Описание поездки",
                hintStyle: Constants.getDefaultStyle(16)),
          ),
        ),
      ],
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                'Новая поездка',
                style: Constants.getDefaultStyle(20),
              ),
            ),
            margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(24),
              child: form),
          FlatButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                final DateTime dateToServer = DateTime.utc(
                    model.date.year,
                    model.date.month,
                    model.date.day,
                    model.time.hour,
                    model.time.minute);
                final DateTime dateArriveToServer = DateTime.utc(
                    model.dateArrive.year,
                    model.dateArrive.month,
                    model.dateArrive.day,
                    model.timeArrive.hour,
                    model.timeArrive.minute);
                CreateTrip createTrip = CreateTrip(
                    from: model.from,
                    to: model.to,
                    seats: model.seats,
                    comment: model.comment,
                    startingTime: dateToServer.toIso8601String(),
                    finishTime: dateArriveToServer.toIso8601String(),
                    price: model.price,
                    onlyTwo: model.onlyTwo);
                BlocProvider.of<TripBloc>(context)
                    .add(TripCreateRequested(createTrip: createTrip));
              } else {
                setState(() {
                  autoValidate = true;
                });
              }
            },
            color: Color.fromRGBO(245, 245, 243, 1),
            child: Container(
              width: 330,
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text('Создать', style: Constants.getDefaultStyle(18)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
