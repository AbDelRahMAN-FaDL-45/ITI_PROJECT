import 'package:flutter/material.dart';
import 'package:my_app/features/splash/presentation/widget/Splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: MySplashScreen() ,
    );
  }
}