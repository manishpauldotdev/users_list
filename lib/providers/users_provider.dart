import 'package:flutter/material.dart';

import 'package:users_list/services/fetch_users.dart';

class UsersProvider extends ChangeNotifier {
  final _service = FetchUsersService();
  List _usersList = [];
  List get usersList => _usersList;

  Future<void> fetchUsers(String token) async {
    final response = await _service.fetchUsers(token);

    if (response!['status']) {
      _usersList = response['data'];
      // print(_usersList);
    }

    notifyListeners();
  }
}
