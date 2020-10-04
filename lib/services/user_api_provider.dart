import 'dart:convert';
import 'package:way/models/user.dart';
import 'package:way/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'auth.dart';

class UserProvider {
  Auth auth;

  UserProvider() {
    auth = Auth();
  }

  Future<User> getUserInfo() async {
    final token = await auth.getToken();
    final response = await http.get(Constants.getBaseUrl() + '/users/me',
        headers: {'Authorization':  "Bearer " + token});

    if (response.statusCode == 200) {
      final dynamic userJson = json.decode(response.body);
      return User.fromJson(userJson);
    } else {
      throw Exception('Error fetch user info');
    }
  }
}