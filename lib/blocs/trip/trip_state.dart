import 'package:equatable/equatable.dart';
import 'package:way/models/trip.dart';

abstract class TripState extends Equatable {
  const TripState();

  @override
  List<Object> get props => [];
}

class TripInitial extends TripState {}

class TripFailure extends TripState {}

class TripSuccess extends TripState {
  List<Trip> trips;

  TripSuccess({this.trips}) {
   trips =  this.trips ?? List<Trip>();
  }

  TripSuccess copyWith({ List<Trip> trips, bool hasReachedMax }){
    return TripSuccess(
        trips: trips ?? this.trips,
    );
  }

  @override
  List<Object> get props => [trips];

  @override
  String toString() => 'TripSuccess { trips: ${trips.length} }';
}
