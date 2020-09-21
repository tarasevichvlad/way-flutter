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
  final List<Trip> trips;

  const TripSuccess({this.trips});

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
