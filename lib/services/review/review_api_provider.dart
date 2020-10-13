import 'dart:convert';

import 'package:way/models/review.dart';
import 'package:http/http.dart' as http;
import 'package:way/utils/constants.dart';

import '../auth.dart';

class ReviewProvider {
  Auth auth;

  ReviewProvider() {
    auth = new Auth();
  }

  Future<List<Review>> getMyReviews() async {
    final token = await auth.getToken();
    final response = await http.get(Constants.getBaseUrl() + '/reviews/me',
        headers: {'Authorization':  "Bearer " + token});

    if (response.statusCode == 200) {
      final List<dynamic> tripJson = json.decode(response.body);
      return tripJson.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('Error fetch trips');
    }
  }
}