import 'package:http/http.dart' as http;
import 'package:way/models/create_trip.dart';
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
    print(response.body);
    if (response.statusCode == 200) {
      try {
        final List<dynamic> tripJson = json.decode(response.body);
        return tripJson.map((json) => Trip.fromJson(json)).toList();
      } catch (e) {
        throw Exception('Error search trips');
      }
    } else {
      throw Exception('Error search trips');
    }
  }

  Future<Null> createTrip(CreateTrip data) async {
    final token = await auth.getToken();
    final response = await http.post(Constants.getBaseUrl() + '/trips',
        headers: {
          'Authorization': "Bearer " + token,
          'Content-Type': 'application/json'
        },
        body: json.encode(data));

    if (response.statusCode == 200) {
      try {
        return null;
      } catch (e) {
        throw Exception('Error create trip');
      }
    } else {
      throw Exception('Error create trip');
    }
  }

  Future<Trip> getTripById(String tripId) async {
    final token = await auth.getToken();
    final response = await http.get(Constants.getBaseUrl() + "/trips/${tripId}",
        headers: {
          'Authorization': "Bearer " + token,
          'Content-Type': 'application/json'
        });
    if (response.statusCode == 200) {
      try {
        final dynamic tripJson = json.decode(response.body);
        return Trip.fromJson(tripJson);
      } catch (e) {
        throw Exception('Error get trip by id');
      }
    } else {
      throw Exception('Error get trip by id');
    }
  }
}
