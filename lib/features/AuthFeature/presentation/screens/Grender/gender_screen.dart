import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/constants/padding_constants.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/auth_glass_container.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/custom_row.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/progress_indicator.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/widgets/custom_button.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(AppImages.background2),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomRow(
                      text1: S.of(context).tellUsAboutYourself,
                      text2: S.of(context).weNeedToKnowYourGender,
                    ),
                    _buildGender(context),
                    if (selectedGender != null)
                      CustomButton(
                        title: S.of(context).next,
                        onTap: () {},
                        color: AppColors.mainColor,
                        textColor: Colors.white,
                        width: 0.95.sw,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGender(BuildContext context) {
    return AuthGlassContainer(
      width: 0.95.sw,
      height: 0.35.sh,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: PaddingConstants.vertical,
          ),
          child: Column(
            children: [
              const CustomProgressIndicator(progress: 1, total: 6, current: 1),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = S.of(context).male;
                  });
                },
                child: Container(
                  height: 80.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                    color:
                        selectedGender == S.of(context).male
                            ? AppColors.mainColor
                            : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          selectedGender == S.of(context).male
                              ? AppColors.mainColor
                              : Colors.white,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        color:
                            selectedGender == S.of(context).male
                                ? Colors.white
                                : Colors.white,
                        size: 55,
                      ),
                      Text(
                        S.of(context).male,
                        style: AppTextStyles.bodyText1.copyWith(
                          color:
                              selectedGender == S.of(context).male
                                  ? Colors.white
                                  : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = S.of(context).female;
                  });
                },
                child: Container(
                  height: 80.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                    color:
                        selectedGender == S.of(context).female
                            ? AppColors.mainColor
                            : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          selectedGender == S.of(context).female
                              ? AppColors.mainColor
                              : Colors.white,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        color:
                            selectedGender == S.of(context).female
                                ? Colors.white
                                : Colors.white,
                        size: 55,
                      ),
                      Text(
                        S.of(context).female,
                        style: AppTextStyles.bodyText1.copyWith(
                          color:
                              selectedGender == S.of(context).female
                                  ? Colors.white
                                  : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
