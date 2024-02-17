import 'package:flutter/material.dart';
import 'package:meetup/onboarding/pages/onboarding_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: OnboardingPage(),
    );
  }
}
