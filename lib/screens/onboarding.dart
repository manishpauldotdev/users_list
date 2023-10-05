import 'package:flutter/material.dart';

import 'package:users_list/widgets/social_login_buttons.dart';
import 'package:users_list/widgets/user_onboarding_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/funnel.png',
              width: 40,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'SALES TOP',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset('assets/images/login_img.png'),
          const Text(
            'Hello!',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
            child: Text(
              'Welcome to Sales TOP A Platform To Manage Real Estate Needs.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserOnboardingButton(
                route: 'login',
                textTitle: 'Login',
                buttonColor: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              UserOnboardingButton(
                route: '',
                textTitle: 'Sign Up',
                buttonColor: Colors.white,
              ),
            ],
          ),
          const Spacer(),
          const Column(
            children: [
              Text(
                'Or via social media',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              SocialLoginButtons(),
            ],
          ),
          const SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}
