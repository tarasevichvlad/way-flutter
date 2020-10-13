import 'package:equatable/equatable.dart';
import 'package:way/models/user.dart';

class Review extends Equatable {
  String id;
  User from;
  User to;
  String body;
  double rating;

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    from = User.fromJson(json['from']);
    to = User.fromJson(json['to']);
    body = json['body'];
    rating =  double.parse(json['rating'].toStringAsExponential(1));
  }

  @override
  List<Object> get props => [];

}