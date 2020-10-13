import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/user/user_bloc.dart';
import 'package:way/blocs/user/user_event.dart';
import 'package:way/blocs/user/user_state.dart';
import 'package:way/services/review/review_repository.dart';
import 'package:way/services/trip/trip_repository.dart';
import 'package:way/services/user/user_repository.dart';
import 'package:way/widgets/account.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => UserBloc(UserRepository(), TripRepository(), ReviewRepository(), UserInitial())..add(UserFetched()), child: Account());
  }
}
