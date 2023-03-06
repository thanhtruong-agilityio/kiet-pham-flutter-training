import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/theme/theme.dart';
import 'package:gotour_app/features/auth/login_page.dart';
import 'package:gotour_app/features/auth/sign_up.dart';
import 'package:gotour_app/features/hot_place/hot_place_page.dart';
import 'package:gotour_app/features/main/main_page.dart';
import 'package:gotour_app/features/misc/onboarding_page.dart';
import 'package:gotour_app/features/tour_details/tour_details_page.dart';
import 'package:gotour_app/main.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const GTOnboardingScreen(),
    ),
    GoRoute(
      path: '/login-page',
      builder: (context, state) => const GTLoginPage(),
    ),
    GoRoute(
      path: '/sign-up-page',
      builder: (context, state) => const GTSignUpPage(),
    ),
    GoRoute(
      name: 'main',
      path: '/main-page',
      builder: (context, state) => const GTMainPage(),
    ),
    GoRoute(
      name: 'tour-details',
      path: '/tour-details',
      builder: (context, state) => const GTTourDetails(),
    ),
    GoRoute(
      name: 'hot-place',
      path: '/hot-place',
      builder: (context, state) => const GTHotPlace(),
    ),
  ],
);

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then(
      (value) => {
        FlutterNativeSplash.remove(),
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        locale: const Locale('en', 'US'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        theme: GTTheme.lightTheme,
      );
}
