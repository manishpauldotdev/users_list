import 'dart:convert';

import 'package:users_list/constants.dart';
import 'package:http/http.dart' as http;

class UserLogoutService {
  Future<Map<String, dynamic>?> userLogout(String token) async {
    try {
      const url = '${Apis.baseUrl}${Apis.logout}';
      final uri = Uri.parse(url);
      final headers = {'Authorization': 'Bearer $token'};

      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return json;
      }
    } catch (e) {
      e.toString();
    }
    return {};
  }
}
