import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/splash/presentation/SplashView.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ShoeApp());
}

class ShoeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.rubik(
            textStyle: textTheme.bodyMedium,
            fontWeight: FontWeight.w500, // Rubik Medium
            fontStyle: FontStyle.italic, // Italic
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
