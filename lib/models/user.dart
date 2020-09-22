import 'package:equatable/equatable.dart';
import 'car.dart';

class User extends Equatable{
  String id;
  String firstName;
  String lastName;
  String phone;
  Car car;
  double rating;

  User();
  @override
  List<Object> get props => [id, firstName, lastName, phone, car, rating];

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    rating =  double.parse(json['rating'].toStringAsExponential(1));
    if (json['car'] != null) {
      car = Car.fromJson(json['car']);
    }
  }

  String getFullName()
  {
    return '${this.firstName} ${this.lastName}';
  }
}