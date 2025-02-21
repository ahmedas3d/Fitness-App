import 'package:fitness_app/features/AuthFeature/presentation/screens/signin_screen.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/screens/onboarding_screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String login = '/login';
  // static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      // case home:
      //   return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(),
                body: const Center(child: Text('Page not found')),
              ),
        );
    }
  }
}
