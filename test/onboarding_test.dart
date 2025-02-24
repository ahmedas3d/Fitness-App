import 'package:fitness_app/features/Splash&Onbording/presentation/screens/onboarding_screens.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/widgets/custom_button.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('OnboardingScreen Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const OnboardingScreen(),
      ),
    );

    // التحقق من وجود العناصر الأساسية
    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(SmoothPageIndicator), findsOneWidget);
    expect(find.byType(CustomButton), findsOneWidget);
  });
}
