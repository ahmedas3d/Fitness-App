import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/constants/padding_constants.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/auth_glass_container.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/picker_widget.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/custom_row.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/progress_indicator.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/widgets/custom_button.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HightScreen extends StatefulWidget {
  const HightScreen({super.key});

  @override
  State<HightScreen> createState() => _HightScreenState();
}

class _HightScreenState extends State<HightScreen> {
  int selectedHight = 150;
  final PageController _pageController = PageController(
    viewportFraction: 0.17,
    initialPage: 150 - 100,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background2),
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
                      text1: S.of(context).whatIsYourWeight,
                      text2:
                          S.of(context).thisHelpsUsCreateYourPersonalizedPlan,
                    ),
                    AuthGlassContainer(
                      width: double.infinity,
                      height: 0.35.sh,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: PaddingConstants.vertical,
                          ),
                          child: Column(
                            children: [
                              const CustomProgressIndicator(
                                progress: 3,
                                total: 6,
                                current: 3,
                              ),
                              SizedBox(height: 10.h),
                              PickerWidget(
                                selectedValue: selectedHight,
                                pageController: _pageController,
                                onValueChanged: (newHight) {
                                  setState(() {
                                    selectedHight = newHight;
                                  });
                                },
                                title: S.of(context).hight,
                                count: 300,
                                startFrom: 100,
                              ),
                              Icon(
                                Icons.arrow_drop_up,
                                color: AppColors.mainColor,
                                size: 40.sp,
                              ),
                              CustomButton(
                                title: S.of(context).next,
                                onTap: () {},
                                color: AppColors.mainColor,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
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
}
