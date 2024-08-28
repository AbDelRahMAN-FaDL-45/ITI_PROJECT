import 'package:flutter/material.dart';
import 'package:my_app/features/onBoarding/presentation/widget/onBoarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: OnboardingBody(),

    );
  }
}