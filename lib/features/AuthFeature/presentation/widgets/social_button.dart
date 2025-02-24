import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final Color iconColor;
  final IconData icon;
  final Color? borderColor;
  final double size;

  const SocialButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.iconColor,
    required this.icon,
    this.borderColor,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1,
          ),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }
}
