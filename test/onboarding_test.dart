import 'package:fitness_app/features/AuthFeature/presentation/screens/SignIn&SignUp/signin_screen.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/screens/onboarding_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  testWidgets('OnboardingScreen UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const OnboardingScreen(),
      ),
    );

    await tester.pumpAndSettle(); // Ensure all animations and UI elements load

    // Verify the presence of PageView
    expect(find.byType(PageView), findsOneWidget);

    // Verify the presence of the page indicator
    expect(find.byType(SmoothPageIndicator), findsOneWidget);

    // Ensure correct text exists before interaction
    expect(find.text('Next'), findsOneWidget);

    // Tap the "Next" button to navigate to the second page
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Verify if the second page has expected content
    expect(find.textContaining('Page 2'), findsWidgets);

    // Tap the "Back" button to return to the first page
    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Page 1'), findsWidgets);

    // Navigate to the last page and tap "Get Started"
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Ensure navigation to the login screen
    expect(find.byType(OnboardingScreen), findsNothing);
    expect(find.byType(SignInScreen), findsOneWidget);
  });
}
