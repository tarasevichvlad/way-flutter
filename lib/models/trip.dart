import 'package:equatable/equatable.dart';

import 'passenger.dart';

class Trip extends Equatable {
  String id;
  Null driver;
  int price;
  String comment;
  String from;
  String to;
  int seats;
  String startingTime;
  String finishTime;
  List<Passenger> passengers;

  Trip(
      {this.id,
      this.driver,
      this.price,
      this.comment,
      this.from,
      this.to,
      this.seats,
      this.startingTime,
      this.finishTime,
      this.passengers});

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    price = json['price'];
    comment = json['comment'];
    from = json['from'];
    to = json['to'];
    seats = json['seats'];
    startingTime = json['startingTime'];
    finishTime = json['finishTime'];
    if (json['passengers'] != null) {
      passengers = new List<Passenger>();
      json['passengers'].forEach((v) {
        passengers.add(new Passenger.fromJson(v));
      });
    }
  }

  @override
  List<Object> get props => [id, driver, price, comment, from, to, seats, startingTime,finishTime, passengers];

  @override
  String toString() => 'Trip { id: $id }';
}
