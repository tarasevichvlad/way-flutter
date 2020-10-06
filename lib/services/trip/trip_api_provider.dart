import 'package:http/http.dart' as http;
import '../../models/trip.dart';
import '../../utils/constants.dart';
import 'dart:convert';

import '../auth.dart';

class TripProvider {
  Auth auth;

  TripProvider() {
    auth = new Auth();
  }

  Future<List<Trip>> getMyTrips() async {
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

  Future<List<Trip>> getActiveTrips() async {
    final token = await auth.getToken();
    final response = await http.get(Constants.getBaseUrl() + '/trips/me/active',
        headers: {'Authorization':  "Bearer " + token});

    if (response.statusCode == 200) {
      final List<dynamic> tripJson = json.decode(response.body);
      return tripJson.map((json) => Trip.fromJson(json)).toList();
    } else {
      throw Exception('Error fetch trips');
    }
  }

  Future<List<Trip>> getFinishedTrips() async {
    final token = await auth.getToken();
    final response = await http.get(Constants.getBaseUrl() + '/trips/me/finished',
        headers: {'Authorization':  "Bearer " + token});

    if (response.statusCode == 200) {
      final List<dynamic> tripJson = json.decode(response.body);
      return tripJson.map((json) => Trip.fromJson(json)).toList();
    } else {
      throw Exception('Error fetch trips');
    }
  }
}
