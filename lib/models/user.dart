import 'package:equatable/equatable.dart';
import 'car.dart';

class User extends Equatable{
  String id;
  String firstName;
  String lastName;
  String phone;
  Car car;

  User();
  @override
  List<Object> get props => [];

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];

    if (json['car'] != null) {
      car = Car.fromJson(json['car']);
    }
  }
}