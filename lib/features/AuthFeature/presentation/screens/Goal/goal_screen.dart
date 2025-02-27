import 'package:fitness_app/core/constants/app_colors.dart';
import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/constants/padding_constants.dart';
import 'package:fitness_app/features/AuthFeature/presentation/screens/Activity/activity_screen.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/auth_glass_container.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/create_route.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/custom_row.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/progress_indicator.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/widgets/custom_button.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  String? selectedGoal;
  List<String> goals = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      goals = [
        S.of(context).gainWeight,
        S.of(context).loseWeight,
        S.of(context).getFitter,
        S.of(context).gainMoreFlexible,
        S.of(context).learnTheBasic,
      ];
    });
  }

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
                      text1: S.of(context).whatIsYourGoal,
                      text2:
                          S.of(context).thisHelpsUsCreateYourPersonalizedPlan,
                    ),
                    AuthGlassContainer(
                      width: double.infinity,
                      height: 0.55.sh,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: PaddingConstants.vertical,
                        ),
                        child: Column(
                          children: [
                            const CustomProgressIndicator(
                              progress: 5,
                              total: 6,
                              current: 5,
                            ),
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.only(top: 20),
                                itemCount: goals.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ContentGoal(
                                        goal: goals[index],
                                        selectedGoal: selectedGoal,
                                        onSelected: (value) {
                                          setState(() {
                                            selectedGoal = value;
                                          });
                                        },
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CustomButton(
                              title: S.of(context).next,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CustomPageRoute(page: const ActivityScreen()),
                                );
                              },
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
            ),
          ],
        ),
      ),
    );
  }
}

class ContentGoal extends StatelessWidget {
  final String goal;
  final String? selectedGoal;
  final ValueChanged<String> onSelected;

  const ContentGoal({
    super.key,
    required this.goal,
    required this.selectedGoal,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(goal),
      child: GlassContainer(
        width: double.infinity,
        height: 50,
        borderGradient: const LinearGradient(
          colors: [Colors.white, Colors.white],
        ),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.10),
            Colors.white.withOpacity(0.10),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                goal,
                style: const TextStyle(
                  color: AppColors.fontColor1,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Radio<String>(
                value: goal,
                groupValue: selectedGoal,
                onChanged: (value) => onSelected(value!),
                activeColor: AppColors.mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
