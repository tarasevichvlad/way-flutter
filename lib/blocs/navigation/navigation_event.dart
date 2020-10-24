import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  int pathTo;

  NavigationEvent({this.pathTo});

  @override
  List<Object> get props => [pathTo];
}

class NavigationToTrips extends NavigationEvent {
}

class NavigationStart extends NavigationEvent {
  final int pathTo;

  NavigationStart({this.pathTo}) : assert(pathTo != null);
}
