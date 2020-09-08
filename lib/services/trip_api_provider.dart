import 'package:http/http.dart' as http;
import '../models/trip.dart';
import '../utils/constants.dart';
import 'dart:convert';

class TripProvider {
  Future<List<Trip>> getTrips() async {
    final response = await http.get(Constants.getBaseUrl(),
        headers: {'Authorization': Constants.TOKEN_ID});

    if (response.statusCode == 200) {
      final List<dynamic> tripJson = json.decode(response.body);
      return tripJson.map((json) => Trip.fromJson(json)).toList();
    } else {
      throw Exception('Error fetch trips');
    }
  }
}
