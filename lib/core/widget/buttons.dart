import 'package:flutter/material.dart';
import 'package:my_app/core/const.dart';
import 'package:my_app/core/utils/size_conf.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({Key? key, this.text, this.onTap})
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50, // Adjust the height if needed
        width: SizeConfig.defaultSize! * 18, // Adjust the width to match the button size
        decoration: BoxDecoration(
          color: Color(0xFF5BA4E5), // Color similar to the one in the image
          borderRadius: BorderRadius.circular(25), // Rounded corners
        ),
        child: Center(
          child: Text(
            text ?? 'Get Started',
            style: TextStyle(
              fontSize: 16, // Match the font size to the image
              color: Colors.white, // White text color
              fontWeight: FontWeight.w500, // Medium weight
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
