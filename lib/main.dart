import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_list/providers/login_provider.dart';
import 'package:users_list/providers/users_provider.dart';

import 'package:users_list/screens/onboarding.dart';
import 'package:users_list/screens/login.dart';
import 'package:users_list/screens/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => UsersProvider()),
      ],
      child: MaterialApp(
        title: 'UsersList',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          'onboarding': (context) => const OnboardingScreen(),
          'login': (context) => const LoginScreen(),
          'users': (context) => const UsersScreen(),
        },
        home: const OnboardingScreen(),
      ),
    );
  }
}
