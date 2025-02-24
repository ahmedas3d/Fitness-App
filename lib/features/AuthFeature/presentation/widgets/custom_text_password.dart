import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PasswordValidator {
  static String? validate(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return 'Please enter password';

    const pattern = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{6,}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return S.of(context).passwordMustContain;
    }
    return null;
  }
}

class CustomPasswordField extends StatefulWidget {
  final String label;
  final String hint;
  final bool initialObscure;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final InputDecoration? decoration;

  const CustomPasswordField({
    super.key,
    required this.label,
    required this.hint,
    this.initialObscure = true,
    this.controller,
    this.onChanged,
    this.validator,
    this.decoration,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late bool _isObscured;
  final _defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(color: AppColors.fontColor2, width: 1),
  );

  @override
  void initState() {
    super.initState();
    _isObscured = widget.initialObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscured,
      onChanged: widget.onChanged,
      style: const TextStyle(color: AppColors.fontColor2),
      decoration: _buildDecoration(),
      validator:
          widget.validator ??
          (value) => PasswordValidator.validate(context, value),
    );
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      label: Text(widget.label),
      hintText: widget.hint,
      prefixIcon: const Icon(Icons.lock_outline, color: AppColors.fontColor2),
      suffixIcon: _buildVisibilityToggle(),
      enabledBorder: _defaultBorder,
      focusedBorder: _defaultBorder,
      errorBorder: _defaultBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: _defaultBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red),
      ),
      labelStyle: const TextStyle(color: AppColors.fontColor2),
      hintStyle: const TextStyle(color: AppColors.fontColor2, fontSize: 12),
      errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
      errorMaxLines: 5,
    ).applyDefaults(Theme.of(context).inputDecorationTheme);
  }

  Widget _buildVisibilityToggle() {
    return IconButton(
      icon: Icon(
        _isObscured ? Icons.visibility_off : Icons.visibility,
        color: AppColors.fontColor2,
      ),
      onPressed: () => setState(() => _isObscured = !_isObscured),
    );
  }
}
