import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 35.h,
                  width: 35.h,
                  decoration: const BoxDecoration(
                    color: AppColors.mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              SizedBox(width: 82.w),
              Image.asset(AppImages.logo, height: 100.h),
            ],
          ),
          SizedBox(height: 20.h),
          Text(text1, style: AppTextStyles.heading2),
          Text(text2, style: AppTextStyles.bodyText1),
        ],
      ),
    );
  }
}













  // Widget _buildHeader(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 18.h, left: 20.w, right: 20.w),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             GestureDetector(
  //               onTap: () => Navigator.pop(context),
  //               child: Container(
  //                 height: 35.h,
  //                 width: 35.h,
  //                 decoration: const BoxDecoration(
  //                   color: AppColors.mainColor,
  //                   shape: BoxShape.circle,
  //                 ),
  //                 child: const Icon(Icons.arrow_back, color: Colors.white),
  //               ),
  //             ),
  //             SizedBox(width: 82.w),
  //             Image.asset(AppImages.logo, height: 100.h),
  //           ],
  //         ),
  //         SizedBox(height: 20.h),
  //         Text(
  //           S.of(context).tellUsAboutYourself,
  //           style: AppTextStyles.heading2,
  //         ),
  //         Text(
  //           S.of(context).weNeedToKnowYourGender,
  //           style: AppTextStyles.bodyText1,
  //         ),
  //       ],
  //     ),
  //   );
  // }