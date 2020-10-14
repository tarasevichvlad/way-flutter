import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {}

class NavgationStart extends NavigationEvent {
  final String pathTo;

  NavgationStart({this.pathTo}) : assert(pathTo != null);

  @override
  List<Object> get props => [pathTo];
}
