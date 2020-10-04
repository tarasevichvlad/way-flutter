import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/user/user_bloc.dart';
import 'package:way/blocs/user/user_event.dart';
import 'package:way/blocs/user/user_state.dart';
import 'package:way/services/user_repository.dart';
import 'package:way/widgets/account.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => UserBloc(UserRepository(), UserInitial())..add(UserFetched()), child: Account());
  }
}
