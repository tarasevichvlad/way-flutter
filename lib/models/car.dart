import 'package:equatable/equatable.dart';

class Car extends Equatable{
  String id;
  String model;
  String registrationPlate;

  Car();

  @override
  List<Object> get props => [];

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    model = json['model'];
    registrationPlate = json['registrationPlate'];
  }
}