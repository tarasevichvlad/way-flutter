import 'package:way/models/review.dart';
import 'package:way/services/review/review_api_provider.dart';

class ReviewRepository {
  ReviewProvider _reviewProvider = ReviewProvider();

  Future<List<Review>> getMyReviews() => _reviewProvider.getMyReviews();
}