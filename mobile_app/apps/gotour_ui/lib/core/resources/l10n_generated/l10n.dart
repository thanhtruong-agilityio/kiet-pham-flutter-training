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

  /// `Log Out`
  String get LogOut {
    return Intl.message(
      'Log Out',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get DarkTheme {
    return Intl.message(
      'Dark',
      name: 'DarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get LightTheme {
    return Intl.message(
      'Light',
      name: 'LightTheme',
      desc: '',
      args: [],
    );
  }

  /// `coming soon...`
  String get comingSoon {
    return Intl.message(
      'coming soon...',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `example@email.com`
  String get emailExample {
    return Intl.message(
      'example@email.com',
      name: 'emailExample',
      desc: '',
      args: [],
    );
  }

  /// `loading...`
  String get loading {
    return Intl.message(
      'loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
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
  String get onboardingPageLastTitle {
    return Intl.message(
      'Enjoy Tour',
      name: 'onboardingPageLastTitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore your favorite destination around the world.`
  String get onboardingPageFirstDescription {
    return Intl.message(
      'Explore your favorite destination around the world.',
      name: 'onboardingPageFirstDescription',
      desc: '',
      args: [],
    );
  }

  /// `Make your travel experience very easy & peasy.`
  String get onboardingPageSecondDescription {
    return Intl.message(
      'Make your travel experience very easy & peasy.',
      name: 'onboardingPageSecondDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy your favorite destination with your love one.`
  String get onboardingPageLastDescription {
    return Intl.message(
      'Enjoy your favorite destination with your love one.',
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

  /// `Already have an account?`
  String get signUpPageAlreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'signUpPageAlreadyHaveAnAccount',
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

  /// `My location is empty`
  String get mainPageMyLocationIsEmpty {
    return Intl.message(
      'My location is empty',
      name: 'mainPageMyLocationIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `The location/place name could not be found`
  String get bestPlaceCouldNotBeFound {
    return Intl.message(
      'The location/place name could not be found',
      name: 'bestPlaceCouldNotBeFound',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileScreenTitle {
    return Intl.message(
      'Profile',
      name: 'profileScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Preference`
  String get profileScreenPreference {
    return Intl.message(
      'Preference',
      name: 'profileScreenPreference',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get profileScreenNotification {
    return Intl.message(
      'Notification',
      name: 'profileScreenNotification',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get profileScreenLanguage {
    return Intl.message(
      'Language',
      name: 'profileScreenLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get profileScreenCurrency {
    return Intl.message(
      'Currency',
      name: 'profileScreenCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Banking & Payment`
  String get profileScreenBankingAndPayment {
    return Intl.message(
      'Banking & Payment',
      name: 'profileScreenBankingAndPayment',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get profileScreenPaymentMethod {
    return Intl.message(
      'Payment method',
      name: 'profileScreenPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get profileScreenPrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'profileScreenPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get profileScreenTermsOfUse {
    return Intl.message(
      'Terms of Use',
      name: 'profileScreenTermsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Gotour Widgetbook`
  String get widgetbookTitle {
    return Intl.message(
      'Gotour Widgetbook',
      name: 'widgetbookTitle',
      desc: '',
      args: [],
    );
  }

  /// `Widgets`
  String get widgetbookWidgets {
    return Intl.message(
      'Widgets',
      name: 'widgetbookWidgets',
      desc: '',
      args: [],
    );
  }

  /// `GTButtons`
  String get widgetbookButtons {
    return Intl.message(
      'GTButtons',
      name: 'widgetbookButtons',
      desc: '',
      args: [],
    );
  }

  /// `All Button`
  String get widgetbookAllButtons {
    return Intl.message(
      'All Button',
      name: 'widgetbookAllButtons',
      desc: '',
      args: [],
    );
  }

  /// `GTTextField`
  String get widgetbookTextFields {
    return Intl.message(
      'GTTextField',
      name: 'widgetbookTextFields',
      desc: '',
      args: [],
    );
  }

  /// `GTText`
  String get widgetbookText {
    return Intl.message(
      'GTText',
      name: 'widgetbookText',
      desc: '',
      args: [],
    );
  }

  /// `GTScaffold`
  String get widgetbookScaffold {
    return Intl.message(
      'GTScaffold',
      name: 'widgetbookScaffold',
      desc: '',
      args: [],
    );
  }

  /// `GTBottomNavigationBar`
  String get widgetbookBottomNavigationBar {
    return Intl.message(
      'GTBottomNavigationBar',
      name: 'widgetbookBottomNavigationBar',
      desc: '',
      args: [],
    );
  }

  /// `GTColor`
  String get widgetbookGTColor {
    return Intl.message(
      'GTColor',
      name: 'widgetbookGTColor',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get widgetbookColor {
    return Intl.message(
      'Color',
      name: 'widgetbookColor',
      desc: '',
      args: [],
    );
  }

  /// `GTCheckbox`
  String get widgetbookGTCheckbox {
    return Intl.message(
      'GTCheckbox',
      name: 'widgetbookGTCheckbox',
      desc: '',
      args: [],
    );
  }

  /// `GTGenders`
  String get widgetbookGTGenders {
    return Intl.message(
      'GTGenders',
      name: 'widgetbookGTGenders',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notificationPageNotifications {
    return Intl.message(
      'Notifications',
      name: 'notificationPageNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Bookmarked`
  String get notificationPageBookmarked {
    return Intl.message(
      'Bookmarked',
      name: 'notificationPageBookmarked',
      desc: '',
      args: [],
    );
  }

  /// `26/03 2023`
  String get notificationPageDay {
    return Intl.message(
      '26/03 2023',
      name: 'notificationPageDay',
      desc: '',
      args: [],
    );
  }

  /// `16:53 PM`
  String get notificationPageTime {
    return Intl.message(
      '16:53 PM',
      name: 'notificationPageTime',
      desc: '',
      args: [],
    );
  }

  /// `You have added da nang tour to your bookmarks list`
  String get notificationPageMessage {
    return Intl.message(
      'You have added da nang tour to your bookmarks list',
      name: 'notificationPageMessage',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chatPageTitle {
    return Intl.message(
      'Chat',
      name: 'chatPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get chatPageTitleMessage {
    return Intl.message(
      'User Name',
      name: 'chatPageTitleMessage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to gotour chat`
  String get chatPageContent {
    return Intl.message(
      'Welcome to gotour chat',
      name: 'chatPageContent',
      desc: '',
      args: [],
    );
  }

  /// `16:53 PM`
  String get chatPageTime {
    return Intl.message(
      '16:53 PM',
      name: 'chatPageTime',
      desc: '',
      args: [],
    );
  }

  /// `26/03 2023`
  String get chatPageDay {
    return Intl.message(
      '26/03 2023',
      name: 'chatPageDay',
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

  /// `Enter a valid email`
  String get errorInValidEmail {
    return Intl.message(
      'Enter a valid email',
      name: 'errorInValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be more than 6 characters`
  String get errorInValidPassword {
    return Intl.message(
      'Password must be more than 6 characters',
      name: 'errorInValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password must be same as password`
  String get errorInvalidPasswordConfirm {
    return Intl.message(
      'Confirm password must be same as password',
      name: 'errorInvalidPasswordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `We have sent you a password reset email. Please check your email`
  String get forgotPasswordMessage {
    return Intl.message(
      'We have sent you a password reset email. Please check your email',
      name: 'forgotPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please verify email`
  String get verifyEmailMessage {
    return Intl.message(
      'Please verify email',
      name: 'verifyEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email`
  String get checkyourEmailMessage {
    return Intl.message(
      'Please check your email',
      name: 'checkyourEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out`
  String get logOutMessage {
    return Intl.message(
      'Do you want to log out',
      name: 'logOutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Add bookmark successful`
  String get bookMarkSuccessMessage {
    return Intl.message(
      'Add bookmark successful',
      name: 'bookMarkSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Remove bookmark successful`
  String get unBookMarkSuccessMessage {
    return Intl.message(
      'Remove bookmark successful',
      name: 'unBookMarkSuccessMessage',
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
