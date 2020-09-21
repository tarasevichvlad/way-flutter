import 'package:equatable/equatable.dart';

class Passenger extends Equatable {
  String id;
  String tripId;
  String passengerId;
  Null passenger;

  Passenger({this.id, this.tripId, this.passengerId, this.passenger});

  Passenger.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['tripId'];
    passengerId = json['passengerId'];
    passenger = json['passenger'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tripId'] = this.tripId;
    data['passengerId'] = this.passengerId;
    data['passenger'] = this.passenger;
    return data;
  }

  @override
  List<Object> get props => [id, tripId, passengerId, passenger];
}
