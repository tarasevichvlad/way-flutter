import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/blocs.dart';
import 'package:way/models/trip.dart';
import 'package:way/search_icons.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  TripBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<TripBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        SearchIcons.location,
                        color: Color.fromRGBO(18, 97, 107, 1),
                      ),
                      Container(
                        child: Text(
                          'Откуда?',
                          style: TextStyle(
                              color: Color.fromRGBO(18, 97, 107, 1),
                              fontFamily: 'ComicSansMS',
                              fontSize: 18),
                        ),
                        padding: EdgeInsets.only(left: 16),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        SearchIcons.location,
                        color: Color.fromRGBO(18, 97, 107, 1),
                      ),
                      Container(
                        child: Text(
                          'Куда?',
                          style: TextStyle(
                              color: Color.fromRGBO(18, 97, 107, 1),
                              fontFamily: 'ComicSansMS',
                              fontSize: 18),
                        ),
                        padding: EdgeInsets.only(left: 16),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        SearchIcons.calendar_outlilne,
                        color: Color.fromRGBO(18, 97, 107, 1),
                      ),
                      Container(
                        child: Text(
                          'Когда?',
                          style: TextStyle(
                              color: Color.fromRGBO(18, 97, 107, 1),
                              fontFamily: 'ComicSansMS',
                              fontSize: 18),
                        ),
                        padding: EdgeInsets.only(left: 16),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        SearchIcons.clock,
                        color: Color.fromRGBO(18, 97, 107, 1),
                      ),
                      Container(
                        child: Text(
                          'Во сколько?',
                          style: TextStyle(
                              color: Color.fromRGBO(18, 97, 107, 1),
                              fontFamily: 'ComicSansMS',
                              fontSize: 18),
                        ),
                        padding: EdgeInsets.only(left: 16),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        SearchIcons.airline_seat_recline_normal,
                        color: Color.fromRGBO(18, 97, 107, 1),
                      ),
                      Container(
                        child: Text(
                          'Сколько нужно мест?',
                          style: TextStyle(
                              color: Color.fromRGBO(18, 97, 107, 1),
                              fontFamily: 'ComicSansMS',
                              fontSize: 18),
                        ),
                        padding: EdgeInsets.only(left: 16),
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      SearchIcons.users,
                      color: Color.fromRGBO(18, 97, 107, 1),
                    ),
                    Container(
                      child: Text(
                        'Сзади только двое?',
                        style: TextStyle(
                            color: Color.fromRGBO(18, 97, 107, 1),
                            fontFamily: 'ComicSansMS',
                            fontSize: 18),
                      ),
                      padding: EdgeInsets.only(left: 16),
                    )
                  ],
                )
              ],
            ),
          ),
          FlatButton(
            onPressed: () {},
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
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(TripFetched());
    }
  }
}

class TripWidget extends StatelessWidget {
  final Trip trip;

  const TripWidget({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${trip.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(trip.id),
      isThreeLine: true,
      subtitle: Text(trip.comment),
      dense: true,
    );
  }
}
