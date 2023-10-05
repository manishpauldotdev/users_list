import 'package:flutter/material.dart';

class User extends StatelessWidget {
  const User({
    super.key,
    required this.name,
    required this.email,
    required this.title,
    required this.address,
  });

  final String name;
  final String email;
  final String title;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Text(email),
          Text(title),
          Text(address),
          const Divider(),
        ],
      ),
    );
  }
}
