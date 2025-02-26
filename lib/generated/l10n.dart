// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `The Price Of Excellence`
  String get titleOn1 {
    return Intl.message(
      'The Price Of Excellence',
      name: 'titleOn1',
      desc: '',
      args: [],
    );
  }

  /// `Is Discipline`
  String get subTitleOn1 {
    return Intl.message(
      'Is Discipline',
      name: 'subTitleOn1',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa.`
  String get descOn1 {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur. Eu urna ut gravida quis id pretium purus. Mauris massa.',
      name: 'descOn1',
      desc: '',
      args: [],
    );
  }

  /// `No More Excuses`
  String get titleOn2 {
    return Intl.message(
      'No More Excuses',
      name: 'titleOn2',
      desc: '',
      args: [],
    );
  }

  /// `Take Action Today`
  String get subTitleOn2 {
    return Intl.message(
      'Take Action Today',
      name: 'subTitleOn2',
      desc: '',
      args: [],
    );
  }

  /// `Stop waiting for the perfect moment. Start your journey now and transform your life!`
  String get descOn2 {
    return Intl.message(
      'Stop waiting for the perfect moment. Start your journey now and transform your life!',
      name: 'descOn2',
      desc: '',
      args: [],
    );
  }

  /// `Your Fitness Journey`
  String get titleOn3 {
    return Intl.message(
      'Your Fitness Journey',
      name: 'titleOn3',
      desc: '',
      args: [],
    );
  }

  /// `Begins Now`
  String get subTitleOn3 {
    return Intl.message('Begins Now', name: 'subTitleOn3', desc: '', args: []);
  }

  /// `With dedication and the right mindset, you can achieve your fitness goals and build a better you!`
  String get descOn3 {
    return Intl.message(
      'With dedication and the right mindset, you can achieve your fitness goals and build a better you!',
      name: 'descOn3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Hey There`
  String get heyThere {
    return Intl.message('Hey There', name: 'heyThere', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Create An Account`
  String get createAccount {
    return Intl.message(
      'Create An Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Enter your first name`
  String get enterYourFirstName {
    return Intl.message(
      'Enter your first name',
      name: 'enterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get pleaseEnterFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'pleaseEnterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Name is too short`
  String get nameTooShort {
    return Intl.message(
      'Name is too short',
      name: 'nameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Enter your last name`
  String get enterYourLastName {
    return Intl.message(
      'Enter your last name',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get pleaseEnterLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'pleaseEnterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Password must contain:\n- At least 6 characters\n- 1 uppercase letter (A-Z)\n- 1 lowercase letter (a-z)\n- 1 number (0-9)\n- 1 special character`
  String get passwordMustContain {
    return Intl.message(
      'Password must contain:\n- At least 6 characters\n- 1 uppercase letter (A-Z)\n- 1 lowercase letter (a-z)\n- 1 number (0-9)\n- 1 special character',
      name: 'passwordMustContain',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter email',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get invalidEmail {
    return Intl.message(
      'Invalid email format',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Tell Us About Yourself`
  String get tellUsAboutYourself {
    return Intl.message(
      'Tell Us About Yourself',
      name: 'tellUsAboutYourself',
      desc: '',
      args: [],
    );
  }

  /// `We Need To Know Your Gender`
  String get weNeedToKnowYourGender {
    return Intl.message(
      'We Need To Know Your Gender',
      name: 'weNeedToKnowYourGender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `HOW old are you?`
  String get howOldAreYou {
    return Intl.message(
      'HOW old are you?',
      name: 'howOldAreYou',
      desc: '',
      args: [],
    );
  }

  /// `this helps us create Your personalized plan`
  String get thisHelpsUsCreateYourPersonalizedPlan {
    return Intl.message(
      'this helps us create Your personalized plan',
      name: 'thisHelpsUsCreateYourPersonalizedPlan',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get age {
    return Intl.message('Year', name: 'age', desc: '', args: []);
  }

  /// `Hight(cm)`
  String get hight {
    return Intl.message('Hight(cm)', name: 'hight', desc: '', args: []);
  }

  /// `What is your weight?`
  String get whatIsYourWeight {
    return Intl.message(
      'What is your weight?',
      name: 'whatIsYourWeight',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
