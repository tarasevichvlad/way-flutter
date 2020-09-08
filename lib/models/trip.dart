import 'passenger.dart';

class Trip {
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
    driver = json['driver'];
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver'] = this.driver;
    data['price'] = this.price;
    data['comment'] = this.comment;
    data['from'] = this.from;
    data['to'] = this.to;
    data['seats'] = this.seats;
    data['startingTime'] = this.startingTime;
    data['finishTime'] = this.finishTime;
    if (this.passengers != null) {
      data['passengers'] = this.passengers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
