
import 'package:flutter/material.dart';

class PageviewItem extends StatelessWidget {
  const PageviewItem({super.key, this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.translate(
        offset: Offset(0, -110), // Move the image up by 50 pixels
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}