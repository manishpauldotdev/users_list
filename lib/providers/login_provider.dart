import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_list/services/user_login.dart';
import 'package:users_list/services/user_logout.dart';

class LoginProvider extends ChangeNotifier {
  final _service = UserLoginService();
  String _bearerToken = '';
  String get bearerToken => _bearerToken;

  Future<void> login(String emailId, String password) async {
    final response = await _service.userLogin(emailId, password);

    if (response!['status']) {
      _bearerToken = response['token'];

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', _bearerToken);

      // print('loginProvider $bearerToken');
      notifyListeners();
    }
  }

  Future<void> logout(String token) async {
    final response = await UserLogoutService().userLogout(token);

    if (response!['success'] == "true") {
      _bearerToken = '';
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      notifyListeners();
    }
  }
}
