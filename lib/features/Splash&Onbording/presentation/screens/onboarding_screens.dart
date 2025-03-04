import 'dart:ui';

import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/constants/app_text_styles.dart';
import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/widgets/custom_button.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  late List<OnboardingData> pages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pages = [
      OnboardingData(
        image: AppImages.on1,
        title: S.of(context).titleOn1,
        subtitle: S.of(context).subTitleOn1,
        description: S.of(context).descOn1,
      ),
      OnboardingData(
        image: AppImages.on2,
        title: S.of(context).titleOn2,
        subtitle: S.of(context).subTitleOn2,
        description: S.of(context).descOn2,
      ),
      OnboardingData(
        image: AppImages.on3,
        title: S.of(context).titleOn3,
        subtitle: S.of(context).subTitleOn3,
        description: S.of(context).descOn3,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(color: Colors.black.withOpacity(0.3)),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return OnboardingContent(
                key: ValueKey(index),
                data: pages[index],
                width: width,
                height: height,
              );
            },
          ),
          Positioned(
            bottom: 22.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: pages.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.mainColor,
                    dotColor: Colors.white54,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment:
                        _currentPage == 0
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentPage > 0)
                        CustomButton(
                          title: S.of(context).back,
                          onTap: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          borderColor: AppColors.secondColor30,
                          textColor: Colors.white,
                          width: width * 0.3,
                          color: Colors.transparent,
                        ),
                      CustomButton(
                        title:
                            _currentPage == pages.length - 1
                                ? S.of(context).getStarted
                                : S.of(context).next,
                        onTap: () {
                          if (_currentPage == pages.length - 1) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.login,
                            );
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          }
                        },
                        color: AppColors.mainColor,
                        textColor: AppColors.fontColor1,
                        width:
                            _currentPage == 0
                                ? width * 0.85
                                : width * 0.3, // تغيير عرض الزر هنا
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  OnboardingData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    Key? key,
  });
}

class OnboardingContent extends StatelessWidget {
  final OnboardingData data;
  final double width;
  final double height;

  const OnboardingContent({
    required this.data,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 35.h),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.58, // تخصيص المساحة للصورة فقط
              child: Image.asset(
                data.image,
                width: width * 0.9,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.h),
            GlassContainer.clearGlass(
              width: width * 0.95,
              height: height * 0.28, // ضبط الارتفاع لتجنب Overflow
              borderGradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.13),
                  Colors.black.withOpacity(0.13),
                ],
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.13),
                  Colors.black.withOpacity(0.13),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.title,
                        key: Key(data.title), // ضع الـ Key هنا
                        style: AppTextStyles.heading2,
                      ),
                      SizedBox(height: 8.h),
                      Text(data.subtitle, style: AppTextStyles.heading2),
                      SizedBox(height: 10.h),
                      Text(
                        data.description,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
