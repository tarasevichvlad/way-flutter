import 'package:equatable/equatable.dart';
import 'package:way/models/user.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserFailure extends UserState {}

class UserSuccess extends UserState {
  User user;

  UserSuccess({this.user}) {
    user =  this.user;
  }

  UserSuccess copyWith(User user){
    return UserSuccess(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user];
}