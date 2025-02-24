import 'package:fitness_app/core/constants/padding_constants.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class AuthGlassContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const AuthGlassContainer({
    super.key,
    required this.child,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      width: width,
      height: height,
      borderGradient: const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
      ),
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.15),
          Colors.white.withOpacity(0.15),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingConstants.horizontal,
        ),
        child: child,
      ),
    );
  }
}
