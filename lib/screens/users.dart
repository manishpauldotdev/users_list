import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_list/providers/login_provider.dart';

import 'package:users_list/providers/users_provider.dart';
import 'package:users_list/widgets/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List _usersList = [];
  bool isListView = true;

  void fetchUsersData() async {
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    await usersProvider.fetchUsers(token!);

    setState(() {
      _usersList = usersProvider.usersList;
    });
  }

  void signOut() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    final token = loginProvider.bearerToken;

    await loginProvider.logout(token);

    if (loginProvider.bearerToken.isEmpty) {
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          'onboarding',
          (route) => false,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsersData();
  }

  void toggleToListView() {
    setState(() {
      isListView = true;
    });
  }

  void toggleToGridView() {
    setState(() {
      isListView = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget showUsers = ListView.builder(
      itemCount: _usersList.length,
      itemBuilder: (context, index) {
        return User(
          name: _usersList[index]['name'],
          email: _usersList[index]['email'],
          title: _usersList[index]['roles'][0]['title'],
          address: _usersList[index]['address'] ?? 'NA',
        );
      },
    );

    if (!isListView) {
      showUsers = GridView.builder(
          itemCount: _usersList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return User(
              name: _usersList[index]['name'],
              email: _usersList[index]['email'],
              title: _usersList[index]['roles'][0]['title'],
              address: _usersList[index]['address'] ?? 'NA',
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Users'),
        actions: [
          IconButton(onPressed: toggleToListView, icon: const Icon(Icons.list)),
          IconButton(
              onPressed: toggleToGridView, icon: const Icon(Icons.grid_on)),
          IconButton(onPressed: signOut, icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      body: _usersList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : showUsers,
    );
  }
}
