import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/constants/padding_constants.dart';
import 'package:fitness_app/features/AuthFeature/presentation/screens/Hight/hight_screen.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/auth_glass_container.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/create_route.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/custom_row.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/picker_widget.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/progress_indicator.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/widgets/custom_button.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int selectedWeight = 85;
  final PageController _pageController = PageController(
    viewportFraction: 0.17,
    initialPage: 85 - 50,
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
                      text1: S.of(context).weNeedToKnowYourWeight,
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
                                selectedValue: selectedWeight,
                                pageController: _pageController,
                                onValueChanged: (newWeight) {
                                  setState(() {
                                    selectedWeight = newWeight;
                                  });
                                },
                                title: S.of(context).weight,
                                count: 300,
                                startFrom: 50,
                              ),
                              Icon(
                                Icons.arrow_drop_up,
                                color: AppColors.mainColor,
                                size: 40.sp,
                              ),
                              CustomButton(
                                title: S.of(context).next,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CustomPageRoute(page: const HightScreen()),
                                  );
                                },
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
