import 'dart:ui';

import 'package:fitness_app/core/constants.dart';
import 'package:fitness_app/core/routes/routes.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
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

  final List<OnboardingData> pages = [
    OnboardingData(
      image: AppImages.on1,
      title: "The Price Of Excellence",
      subtitle: "Is Discipline",
      description:
          "Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa.",
    ),
    OnboardingData(
      image: AppImages.on2,
      title: "No More Excuses",
      subtitle: "Take Action Today",
      description:
          "Stop waiting for the perfect moment. Start your journey now and transform your life!",
    ),
    OnboardingData(
      image: AppImages.on3,
      title: "Your Fitness Journey",
      subtitle: "Begins Now",
      description:
          "With dedication and the right mindset, you can achieve your fitness goals and build a better you!",
    ),
  ];

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
          Positioned(
            top: 30,
            right: 20,
            child: TextButton(
              onPressed:
                  () =>
                      Navigator.pushReplacementNamed(context, AppRoutes.login),
              child: const Text('Skip', style: AppTextStyles.bodyText1),
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return OnboardingContent(
                data: pages[index],
                width: width,
                height: height,
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
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
                const SizedBox(height: 20),
                if (_currentPage == 0)
                  customButton(
                    title: "Next",
                    onTap: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    color: AppColors.mainColor,
                    textColor: AppColors.fontColor1,
                    width: width * 0.8,
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customButton(
                        title: "Back",
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
                      customButton(
                        title:
                            _currentPage == pages.length - 1
                                ? "Get Started"
                                : "Next",
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
                        width: width * 0.3,
                      ),
                    ],
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          data.image,
          width: width * 0.9,
          height: height * 0.55,
          fit: BoxFit.contain,
        ),
        GlassContainer.clearGlass(
          width: width * 0.95,
          height: height * 0.28,
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.title, style: AppTextStyles.heading2),
                Text(data.subtitle, style: AppTextStyles.heading2),
                const SizedBox(height: 10),
                Text(
                  data.description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyText1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
