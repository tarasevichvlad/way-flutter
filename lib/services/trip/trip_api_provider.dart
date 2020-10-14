import 'package:http/http.dart' as http;
import 'package:way/models/search_trip.dart';
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
        headers: {'Authorization': "Bearer " + token});

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
        headers: {'Authorization': "Bearer " + token});

    if (response.statusCode == 200) {
      final List<dynamic> tripJson = json.decode(response.body);
      return tripJson.map((json) => Trip.fromJson(json)).toList();
    } else {
      throw Exception('Error fetch trips');
    }
  }

  Future<List<Trip>> getFinishedTrips() async {
    final token = await auth.getToken();
    final response = await http.get(
        Constants.getBaseUrl() + '/trips/me/finished',
        headers: {'Authorization': "Bearer " + token});

    if (response.statusCode == 200) {
      final List<dynamic> tripJson = json.decode(response.body);
      return tripJson.map((json) => Trip.fromJson(json)).toList();
    } else {
      throw Exception('Error fetch trips');
    }
  }

  Future<List<Trip>> searchTrip(SearchTrip data) async {
    final token = await auth.getToken();
    final response = await http.post(Constants.getBaseUrl() + '/trips/search',
        headers: {
          'Authorization': "Bearer " + token,
          'Content-Type': 'application/json'
        },
        body: json.encode(data));
    if (response.statusCode == 200) {
      final List<dynamic> tripJson = json.decode(response.body);
      return tripJson.map((json) => Trip.fromJson(json)).toList();
    } else {
      throw Exception('Error search trips');
    }
  }
}
