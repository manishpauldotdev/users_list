import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_list/constants.dart';

class FetchUsersService {
  Future<Map<String, dynamic>?> fetchUsers(String token) async {
    try {
      const url = '${Apis.baseUrl}${Apis.users}';
      final uri = Uri.parse(url);
      final headers = {'Authorization': 'Bearer $token'};

      final response = await http.get(uri, headers: headers);

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
