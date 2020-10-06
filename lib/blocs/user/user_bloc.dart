import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:way/blocs/user/user_event.dart';
import 'package:way/blocs/user/user_state.dart';
import 'package:way/models/review.dart';
import 'package:way/models/trip.dart';
import 'package:way/services/review/review_repository.dart';
import 'package:way/services/trip/trip_repository.dart';
import 'package:way/services/user/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final TripRepository tripRepository;
  final ReviewRepository reviewRepository;

  final UserState userDefaultState;

  UserBloc(this.userRepository, this.tripRepository, this.reviewRepository, this.userDefaultState)
      : super(userDefaultState);

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    try {
      yield UserInitial();

      final user = await userRepository.getUserInfo();
      var trips = await tripRepository.getMyTrips();
      final reviews = await reviewRepository.getMyReviews();

      trips = trips ?? List<Trip>();
      user.addTripCount(trips.length);
      user.addReviews(reviews ?? List<Review>());

      yield UserSuccess(user: user);
    } catch (_) {
      yield UserFailure();
    }
  }
}
