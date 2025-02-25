import 'package:fitness_app/features/AuthFeature/presentation/screens/SignIn&SignUp/signin_screen.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/custom_text_field.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/custom_text_password.dart';
import 'package:fitness_app/features/AuthFeature/presentation/widgets/social_button.dart';
import 'package:fitness_app/features/Splash&Onbording/presentation/widgets/custom_button.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('SignUpScreen Widget Test', (WidgetTester tester) async {
    // 1. تحميل الشاشة
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: SignInScreen(),
      ),
    );

    // 2. التحقق من وجود العناصر الأساسية
    expect(find.text('Hey There'), findsOneWidget);
    expect(find.text('Create Account'), findsOneWidget);
    expect(
      find.byType(CustomTextField),
      findsNWidgets(3),
    ); // First Name, Last Name, Email
    expect(find.byType(CustomPasswordField), findsOneWidget); // Password
    expect(find.byType(CustomButton), findsOneWidget); // Register Button
    expect(
      find.byType(SocialButton),
      findsNWidgets(3),
    ); // Google, Facebook, Apple Buttons

    // 3. اختبار إدخال النصوص
    await tester.enterText(
      find.byType(CustomTextField).at(0),
      'John',
    ); // First Name
    await tester.enterText(
      find.byType(CustomTextField).at(1),
      'Doe',
    ); // Last Name
    await tester.enterText(
      find.byType(CustomTextField).at(2),
      'john.doe@example.com',
    ); // Email
    await tester.enterText(
      find.byType(CustomPasswordField),
      'password123',
    ); // Password

    // 4. التحقق من النصوص المدخلة
    expect(find.text('John'), findsOneWidget);
    expect(find.text('Doe'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);
    expect(
      find.text('password123'),
      findsNothing,
    ); // Password should be obscured

    // 5. اختبار النقر على زر التسجيل
    await tester.tap(find.byType(CustomButton));
    await tester.pump(); // إعادة بناء الواجهة بعد النقر

    // 6. التحقق من ظهور رسائل الخطأ إذا كانت الحقول فارغة
    await tester.enterText(
      find.byType(CustomTextField).at(0),
      '',
    ); // إفراغ First Name
    await tester.enterText(
      find.byType(CustomTextField).at(1),
      '',
    ); // إفراغ Last Name
    await tester.enterText(
      find.byType(CustomTextField).at(2),
      '',
    ); // إفراغ Email
    await tester.enterText(
      find.byType(CustomPasswordField),
      '',
    ); // إفراغ Password
    await tester.tap(find.byType(CustomButton));
    await tester.pump(); // إعادة بناء الواجهة بعد النقر

    // 7. التحقق من ظهور رسائل الخطأ
    expect(find.text('Please enter your first name'), findsOneWidget);
    expect(find.text('Please enter your last name'), findsOneWidget);
    expect(find.text('Please enter email'), findsOneWidget);
    expect(find.text('Please enter password'), findsOneWidget);

    // 8. اختبار النقر على زر "Login" للانتقال إلى شاشة تسجيل الدخول
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(); // الانتظار حتى تنتهي الحركات

    // 9. التحقق من الانتقال إلى شاشة تسجيل الدخول
    expect(find.byType(SignInScreen), findsOneWidget);
  });
}
