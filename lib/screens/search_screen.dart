import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/blocs/navigation/navigation_bloc.dart';
import 'package:way/blocs/navigation/navigation_event.dart';
import 'package:way/models/search_trip.dart';
import 'package:way/search_icons.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _from = '';
  String _to = '';
  String _date = '';
  String _time = '';
  int _seats = 0;
  bool _onlyTwo = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TripBloc, TripState>(
      listener: (BuildContext context, TripState state) {
        if (state is TripSearchSuccess) {
          // TODO: navigate to new page
          //BlocProvider.of<NavigationBloc>(context)
          //.add(NavgationStart(pathTo: 'test'));
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
              child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    children: [
                      Container(
                        height: 48,
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              SearchIcons.location,
                              color: Color.fromRGBO(18, 97, 107, 1),
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onSaved: (String val) {
                                    _from = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Откуда?',
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                        fontFamily: 'ComicSansMS',
                                        fontSize: 16),
                                  )),
                              padding: EdgeInsets.only(left: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              SearchIcons.location,
                              color: Color.fromRGBO(18, 97, 107, 1),
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onSaved: (String val) {
                                    _to = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Куда?',
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                        fontFamily: 'ComicSansMS',
                                        fontSize: 16),
                                  )),
                              padding: EdgeInsets.only(left: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              SearchIcons.calendar_outlilne,
                              color: Color.fromRGBO(18, 97, 107, 1),
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onSaved: (String val) {
                                    _date = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Когда?',
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                        fontFamily: 'ComicSansMS',
                                        fontSize: 16),
                                  )),
                              padding: EdgeInsets.only(left: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              SearchIcons.clock,
                              color: Color.fromRGBO(18, 97, 107, 1),
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                  keyboardType: TextInputType.datetime,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onSaved: (String val) {
                                    _time = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Во сколько?',
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                        fontFamily: 'ComicSansMS',
                                        fontSize: 16),
                                  )),
                              padding: EdgeInsets.only(left: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              SearchIcons.airline_seat_recline_normal,
                              color: Color.fromRGBO(18, 97, 107, 1),
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onSaved: (String val) {
                                    _seats = 2;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Сколько нужно мест?',
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                        fontFamily: 'ComicSansMS',
                                        fontSize: 16),
                                  )),
                              padding: EdgeInsets.only(left: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              SearchIcons.users,
                              color: Color.fromRGBO(18, 97, 107, 1),
                            ),
                            Container(
                              width: 250,
                              child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  onSaved: (String val) {
                                    _onlyTwo = false;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Сзади только двое?',
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(18, 97, 107, 1),
                                        fontFamily: 'ComicSansMS',
                                        fontSize: 16),
                                  )),
                              padding: EdgeInsets.only(left: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  SearchTrip searchTrip = SearchTrip(
                      from: _from,
                      to: _to,
                      seats: _seats,
                      dateTime: '${_date}T${_time}Z',
                      onlyTwo: _onlyTwo);
                  BlocProvider.of<TripBloc>(context)
                      .add(TripSearchRequested(searchTrip: searchTrip));
                  _formKey.currentState.save();
                } else {
                  setState(() {
                    _autoValidate = true;
                  });
                }
              },
              color: Color.fromRGBO(245, 245, 243, 1),
              child: Container(
                width: 330,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text('Найти',
                      style: TextStyle(
                          color: Color.fromRGBO(18, 97, 107, 1),
                          fontFamily: 'ComicSansMS',
                          fontSize: 18)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
