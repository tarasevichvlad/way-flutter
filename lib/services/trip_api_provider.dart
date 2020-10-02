import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:http/http.dart' as http;
import '../models/trip.dart';
import '../utils/constants.dart';
import 'dart:convert';

import 'auth.dart';

class TripProvider {
  Auth auth;

  TripProvider() {
    auth = new Auth();
  }

  Future<List<Trip>> getTrips() async {
    final token = await auth.getToken();
    final response = await http.get(Constants.getBaseUrl() + '/trips/me',
        headers: {'Authorization':  "Bearer " + token});

    if (response.statusCode == 200) {
      final List<dynamic> tripJson = json.decode(response.body);
      return tripJson.map((json) => Trip.fromJson(json)).toList();
    } else {
      throw Exception('Error fetch trips');
    }
  }
}
