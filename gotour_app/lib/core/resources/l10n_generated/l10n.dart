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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log In`
  String get loginTitle {
    return Intl.message(
      'Log In',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpTitle {
    return Intl.message(
      'Sign Up',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get textFieldEmail {
    return Intl.message(
      'Email',
      name: 'textFieldEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get textFieldPassword {
    return Intl.message(
      'Password',
      name: 'textFieldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get onboardingPageFistTitle {
    return Intl.message(
      'Explore',
      name: 'onboardingPageFistTitle',
      desc: '',
      args: [],
    );
  }

  /// `Easy Peasy`
  String get onboardingPageSecondTitle {
    return Intl.message(
      'Easy Peasy',
      name: 'onboardingPageSecondTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy Tour`
  String get onboardingPagelastTitle {
    return Intl.message(
      'Enjoy Tour',
      name: 'onboardingPagelastTitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore your favourite destination around the world.`
  String get onboardingPageFirstDescription {
    return Intl.message(
      'Explore your favourite destination around the world.',
      name: 'onboardingPageFirstDescription',
      desc: '',
      args: [],
    );
  }

  /// `Make your travel experince very easy & peasy.`
  String get onboardingPageSecondDescription {
    return Intl.message(
      'Make your travel experince very easy & peasy.',
      name: 'onboardingPageSecondDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy your favourite destination with your love one.`
  String get onboardingPageLastDescription {
    return Intl.message(
      'Enjoy your favourite destination with your love one.',
      name: 'onboardingPageLastDescription',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get loginPageTitle {
    return Intl.message(
      'Log In',
      name: 'loginPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login With Google`
  String get loginPageButtonLoginGG {
    return Intl.message(
      'Login With Google',
      name: 'loginPageButtonLoginGG',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get loginPageButtonForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'loginPageButtonForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Here`
  String get loginPageButtonSignUpHere {
    return Intl.message(
      'Sign Up Here',
      name: 'loginPageButtonSignUpHere',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpPageTitle {
    return Intl.message(
      'Sign Up',
      name: 'signUpPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get signUpPageGenderMale {
    return Intl.message(
      'Male',
      name: 'signUpPageGenderMale',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get signUpPageGenderFemale {
    return Intl.message(
      'Female',
      name: 'signUpPageGenderFemale',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get signUpPageConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'signUpPageConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `I agree and accept the `
  String get signUpPageTextTerms {
    return Intl.message(
      'I agree and accept the ',
      name: 'signUpPageTextTerms',
      desc: '',
      args: [],
    );
  }

  /// `terms ot use.`
  String get signUpPageTextButtonTerms {
    return Intl.message(
      'terms ot use.',
      name: 'signUpPageTextButtonTerms',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordPageTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get forgotPasswordPageButtonSubmit {
    return Intl.message(
      'Submit',
      name: 'forgotPasswordPageButtonSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login Page.`
  String get forgotPasswordPageButtonBackToLoginPage {
    return Intl.message(
      'Back to Login Page.',
      name: 'forgotPasswordPageButtonBackToLoginPage',
      desc: '',
      args: [],
    );
  }

  /// `Get Ready For\nThe Travel Trip!`
  String get mainPageTitle {
    return Intl.message(
      'Get Ready For\nThe Travel Trip!',
      name: 'mainPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `My Location`
  String get mainPageMyLocation {
    return Intl.message(
      'My Location',
      name: 'mainPageMyLocation',
      desc: '',
      args: [],
    );
  }

  /// `Best Place`
  String get mainPageBestPlace {
    return Intl.message(
      'Best Place',
      name: 'mainPageBestPlace',
      desc: '',
      args: [],
    );
  }

  /// `Find your location...`
  String get mainPageHintTextSearchButton {
    return Intl.message(
      'Find your location...',
      name: 'mainPageHintTextSearchButton',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get mainPageTextButton {
    return Intl.message(
      'See All',
      name: 'mainPageTextButton',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get tourDetailsPageService {
    return Intl.message(
      'Service',
      name: 'tourDetailsPageService',
      desc: '',
      args: [],
    );
  }

  /// `Hot Place`
  String get hotPlacePage {
    return Intl.message(
      'Hot Place',
      name: 'hotPlacePage',
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
