import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_app/core/constants/app_colors.dart';

class PickerWidget extends StatelessWidget {
  final int selectedValue;
  final PageController pageController;
  final Function(int) onValueChanged;
  final String title;
  final int count;
  final int startFrom; // ✅ تحديد رقم البداية

  const PickerWidget({
    super.key,
    required this.selectedValue,
    required this.pageController,
    required this.onValueChanged,
    required this.title,
    required this.count,
    this.startFrom = 0, // ✅ قيمة افتراضية تبدأ من 0 (يمكن تغييرها)
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.mainColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 70.h,
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: count,
            onPageChanged: (index) {
              onValueChanged(index + startFrom); // ✅ يعتمد على `startFrom`
            },
            itemBuilder: (context, index) {
              int value = index + startFrom;
              return Center(
                child: Text(
                  "$value",
                  style: TextStyle(
                    fontSize: value == selectedValue ? 40 : 28,
                    fontWeight: FontWeight.bold,
                    color:
                        value == selectedValue
                            ? AppColors.mainColor
                            : Colors.white54,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
