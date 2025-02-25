import 'package:fitness_app/features/AuthFeature/presentation/screens/Grender/gender_screen.dart';
import 'package:fitness_app/features/AuthFeature/presentation/screens/SignIn&SignUp/signin_screen.dart';
import 'package:fitness_app/features/AuthFeature/presentation/screens/SignIn&SignUp/signup_screen.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/screens/onboarding_screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String gender = '/gender';
  // static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case gender:
        return MaterialPageRoute(builder: (_) => const GenderScreen());
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
