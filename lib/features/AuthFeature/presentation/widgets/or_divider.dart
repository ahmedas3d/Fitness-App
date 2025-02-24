import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          Expanded(
            child: Divider(color: Colors.grey, thickness: 1, endIndent: 10),
          ),
          Text("Or", style: AppTextStyles.bodyText1),
          Expanded(
            child: Divider(color: Colors.grey, thickness: 1, indent: 10),
          ),
        ],
      ),
    );
  }
}
