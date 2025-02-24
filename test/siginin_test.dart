import 'package:fitness_app/features/AuthFeature/presentation/screens/signin_screen.dart';
import 'package:fitness_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('Sign In Screen Test', (WidgetTester tester) async {
    // 1. تحميل الواجهة
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

    // 2. التحقق من وجود النصوص الأساسية
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Hey There'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);

    // 3. التحقق من وجود الحقول والنصوص
    expect(
      find.byType(TextFormField),
      findsNWidgets(2),
    ); // حقل الإيميل وكلمة المرور
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // 4. التحقق من وجود الأزرار
    expect(find.byType(ElevatedButton), findsOneWidget); // زر تسجيل الدخول
    expect(find.text('Login'), findsOneWidget);

    // 5. التحقق من وجود الأيقونات
    expect(find.byIcon(Icons.email_outlined), findsOneWidget);
    expect(find.byIcon(Icons.lock_outline), findsOneWidget);

    // 6. اختبار التفاعلات (اختياري)
    await tester.enterText(
      find.byType(TextFormField).first,
      'test@example.com',
    );
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // إعادة بناء الواجهة بعد النقر

    // 7. التحقق من النتائج المتوقعة بعد التفاعل
    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('password123'), findsNothing); // لا يظهر نص كلمة المرور
  });
}
