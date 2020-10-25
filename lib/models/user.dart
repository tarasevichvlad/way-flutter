import 'package:equatable/equatable.dart';
import 'package:way/models/review.dart';
import 'car.dart';

class User extends Equatable {
  String id;
  String firstName;
  String lastName;
  String phone;
  Car car;
  double rating;
  int tripCount;
  List<Review> reviews;

  @override
  List<Object> get props => [id, firstName, lastName, phone, car, rating];

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.car,
      this.rating,
      this.tripCount,
      this.reviews});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    rating = double.parse(json['rating'].toStringAsExponential(1));
    if (json['car'] != null) {
      car = Car.fromJson(json['car']);
    }
  }

  String getFullName() {
    return '${this.firstName} ${this.lastName}';
  }

  void addReviews(List<Review> reviews) {
    this.reviews = reviews;
  }

  void addTripCount(int tripCount) {
    this.tripCount = tripCount;
  }
}
