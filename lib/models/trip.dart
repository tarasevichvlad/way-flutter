import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:way/models/user.dart';

import 'passenger.dart';

class Trip extends Equatable {
  String id;
  User driver;
  int price;
  String comment;
  String from;
  String to;
  int seats;
  DateTime startingTime;
  DateTime finishTime;
  List<Passenger> passengers;
  bool onlyTwoBehind;
  double rating;

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
      this.passengers,
      this.onlyTwoBehind,
      this.rating});

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if(json["driver"] != null) {
      driver = User.fromJson(json["driver"]);
    }
    rating = json['rating'] != null ? json['rating']: 4.3;
    onlyTwoBehind = json['onlyTwoBehind'];
    price = json['price'];
    comment = json['comment'];
    from = json['from'];
    to = json['to'];
    seats = json['seats'];
    startingTime = DateTime.parse(json['startingTime']);
    finishTime = DateTime.parse(json['finishTime']);
    if (json['passengers'] != null) {
      passengers = new List<Passenger>();
      json['passengers'].forEach((v) {
        passengers.add(new Passenger.fromJson(v));
      });
    }
  }

  int getAvailableSeats() {
    final int t = this.passengers.length;
    return this.seats - this.passengers.length;
  }

  @override
  List<Object> get props => [id, driver, price, comment, from, to, seats, startingTime,finishTime, passengers];

  @override
  String toString() => 'Trip { id: $id }';
}
