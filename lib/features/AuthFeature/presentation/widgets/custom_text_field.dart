import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final int? maxLines;

  static const _borderRadius = 25.0;
  static const _borderWidth = 1.0;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autocorrect: false,
      style: AppTextStyles.bodyText2,
      decoration: _buildDecoration(),
      validator: validator,
      maxLines: maxLines,
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      label: Text(label),
      hintText: hint,
      prefixIcon: Icon(icon, color: AppColors.fontColor1, size: 25),
      labelStyle: const TextStyle(color: AppColors.fontColor2),
      hintStyle: const TextStyle(color: AppColors.fontColor2),
      enabledBorder: _buildBorder(AppColors.fontColor1),
      focusedBorder: _buildBorder(AppColors.fontColor1),
      errorBorder: _buildBorder(Colors.red),
      focusedErrorBorder: _buildBorder(Colors.red),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: BorderSide(color: color, width: _borderWidth),
    );
  }
}
