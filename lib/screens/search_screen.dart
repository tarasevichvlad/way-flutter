import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
  DateTime _date;
  TimeOfDay _time;
  int _seats = 0;
  bool _onlyTwo = false;

  @override
  void initState() {
    super.initState();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: block builder
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
                            Stack(overflow: Overflow.visible, children: [
                              IconButton(
                                iconSize: 20,
                                padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                                icon: Icon(
                                  SearchIcons.calendar_outlilne,
                                  color: Color.fromRGBO(18, 97, 107, 1),
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                              Positioned(
                                  child: Container(
                                      width: 250,
                                      child: Text(
                                        _date != null
                                            ? DateFormat('yyyy-MM-dd')
                                                .format(_date)
                                            : 'Когда?',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(18, 97, 107, 1),
                                            fontFamily: 'ComicSansMS',
                                            fontSize: 16),
                                      )),
                                  left: 40,
                                  top: 8)
                            ])
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        padding: EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(overflow: Overflow.visible, children: [
                              IconButton(
                                iconSize: 20,
                                padding: EdgeInsets.fromLTRB(0, 0, 22, 0),
                                icon: Icon(
                                  SearchIcons.clock,
                                  color: Color.fromRGBO(18, 97, 107, 1),
                                ),
                                onPressed: () {
                                  _selectTime(context);
                                },
                              ),
                              Positioned(
                                  child: Container(
                                      width: 250,
                                      child: Text(
                                        _time != null
                                            ? _time.format(context)
                                            : 'Во сколько?',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(18, 97, 107, 1),
                                            fontFamily: 'ComicSansMS',
                                            fontSize: 16),
                                      )),
                                  left: 40,
                                  top: 8)
                            ])
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
                              child: SwitchListTile(
                                title: Text(
                                  'Сзади только двое?',
                                  style: TextStyle(
                                      color: Color.fromRGBO(18, 97, 107, 1),
                                      fontFamily: 'ComicSansMS',
                                      fontSize: 16),
                                ),
                                value: _onlyTwo,
                                onChanged: (value) {
                                  setState(() {
                                    _onlyTwo = value;
                                  });
                                },
                                activeColor: Color.fromRGBO(18, 97, 107, 1),
                              ),
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
