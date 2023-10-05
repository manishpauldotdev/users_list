import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:users_list/constants.dart';

class UserLoginService {
  Future<Map<String, dynamic>?> userLogin(
      String emailId, String password) async {
    try {
      final url =
          '${Apis.baseUrl}${Apis.login}?email=$emailId&password=$password';
      final uri = Uri.parse(url);
      final response = await http.post(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json;
      }
    } catch (e) {
      throw e.toString();
    }
    return {};
  }
}
