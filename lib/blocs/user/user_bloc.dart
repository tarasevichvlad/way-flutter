import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/user/user_event.dart';
import 'package:way/blocs/user/user_state.dart';
import 'package:way/services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  final UserState userDefaultState;

  UserBloc(this.userRepository, this.userDefaultState)
      : super(userDefaultState);

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    try {
      yield UserInitial();

      final user = await userRepository.getUserInfo();
      yield UserSuccess(user: user);
    } catch (_) {
      yield UserFailure();
    }
  }
}
