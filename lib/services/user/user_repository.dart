import 'package:way/models/user.dart';
import 'package:way/services/user/user_api_provider.dart';

class UserRepository {
  UserProvider _userProvider = UserProvider();

  Future<User> getUserInfo() => _userProvider.getUserInfo();
}