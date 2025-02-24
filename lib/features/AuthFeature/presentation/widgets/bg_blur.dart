import 'dart:ui';
import 'package:flutter/material.dart';

class BgBlur extends StatelessWidget {
  final String image;
  const BgBlur({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(color: Colors.black.withOpacity(0.3)),
        ),
      ],
    );
  }
}
