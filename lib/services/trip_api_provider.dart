import 'package:http/http.dart' as http;
import 'package:way/models/search_trip.dart';
import '../models/trip.dart';
import '../utils/constants.dart';
import 'dart:convert';

class TripProvider {
  Future<List<Trip>> getTrips() async {
    final response = await http.get(Constants.getBaseUrl() + '/trips/me',
        headers: {'Authorization': Constants.TOKEN_ID});

    if (response.statusCode == 200) {
      final List<dynamic> tripJson = json.decode(response.body);
      return tripJson.map((json) => Trip.fromJson(json)).toList();
    } else {
      throw Exception('Error fetch trips');
    }
  }

  Future<List<Trip>> searchTrip(SearchTrip data) async {
    final response = await http.post(Constants.getBaseUrl() + '/trips/search',
        headers: {
          'Authorization': Constants.TOKEN_ID,
          "Content-Type": "application/json"
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
