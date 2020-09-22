import 'package:equatable/equatable.dart';

class SearchTrip extends Equatable {
  String from;
  String to;
  String dateTime;
  int seats;
  bool onlyTwo;

  SearchTrip({this.from, this.to, this.dateTime, this.seats, this.onlyTwo});

  SearchTrip.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    dateTime = json['dateTime'];
    seats = json['seats'];
    onlyTwo = json['onlyTwo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['dateTime'] = this.dateTime;
    data['seats'] = this.seats;
    data['onlyTwo'] = this.onlyTwo;
    return data;
  }

  @override
  List<Object> get props => [from, to, dateTime, seats, onlyTwo];
}
