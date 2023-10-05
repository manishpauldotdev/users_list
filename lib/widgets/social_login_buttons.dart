import 'package:flutter/material.dart';

import 'package:users_list/widgets/social_media_button.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SocialMediaButton(
          buttonColor: Colors.blue,
          logoPath: 'assets/images/facebook-30.png',
        ),
        const SocialMediaButton(
          buttonColor: Colors.red,
          logoPath: 'assets/images/google-30.png',
        ),
        SocialMediaButton(
          buttonColor: Colors.blue[900]!,
          logoPath: 'assets/images/linkedin-30.png',
        ),
      ],
    );
  }
}
