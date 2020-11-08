import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/blocs/navigation/navigation_bloc.dart';
import 'package:way/blocs/navigation/navigation_event.dart';
import 'package:way/models/search_trip.dart';
import 'package:way/routes.dart';
import 'package:way/utils/constants.dart';
import 'package:way/widgets/search_form.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  TripModel model;
  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final form = SearchForm(
      autovalidate: autoValidate, // TODO: invstigate
      formKey: _formKey,
      isCreateMode: false,
      onSaved: (TripModel data) {
        model = data;
      },
    );
    form.autovalidate = autoValidate;
    return BlocListener<TripBloc, TripState>(
      listener: (BuildContext context, TripState state) {
        if (state is TripSearchSuccess) {
          BlocProvider.of<NavigationBloc>(context).add(NavigationToSearchTrip(
              pathTo: NestedRoutes.searchListTrip,
              trips: state.trips,
              searchTrips: state.searchTrip));
        }
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Image.asset('assets/images/find.png'),
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
                  SearchTrip searchTrip = SearchTrip(
                      from: model.from,
                      to: model.to,
                      seats: model.seats,
                      dateTime: dateToServer.toIso8601String(),
                      onlyTwo: model.onlyTwo);
                  BlocProvider.of<TripBloc>(context)
                      .add(TripSearchRequested(searchTrip: searchTrip));
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
                  child: Text('Найти', style: Constants.getDefaultStyle(18)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
