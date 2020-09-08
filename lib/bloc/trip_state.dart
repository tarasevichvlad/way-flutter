import 'package:flutter/foundation.dart';

abstract class TripState {}

class TripEmptyState extends TripState {}

class TripLoadingState extends TripState {}

class TripLoadedState extends TripState {
  List<dynamic> loadedTrips;

  TripLoadedState({@required this.loadedTrips}) : assert(loadedTrips != null);
}

class TripErrorState extends TripState {}
