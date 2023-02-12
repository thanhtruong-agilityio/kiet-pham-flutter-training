import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import 'package:gotour_app/core/theme/theme.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/features/auth/login_page.dart';
import 'package:gotour_app/features/auth/sign_up.dart';
import 'package:gotour_app/features/hot-place/hot_place_page.dart';
import 'package:gotour_app/features/main/main_page.dart';
import 'package:gotour_app/features/misc/onboarding-page.dart';
import 'package:gotour_app/features/tour-details/tour_details_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  static const String title = 'Kiet Anh';

  @override
  State<MyApp> createState() => _MyAppState();
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => GTOnboardingScreen(),
    ),
    GoRoute(
      path: '/login-page',
      builder: (context, state) => GTLoginPage(),
    ),
    GoRoute(
      path: '/sign-up-page',
      builder: (context, state) => GTSignUpPage(),
    ),
    GoRoute(
        name: 'main',
        path: '/main-page',
        builder: (context, state) => GTMainPage()),
    GoRoute(
      name: 'tour-details',
      path: '/tour-details',
      builder: (context, state) => GTTourDetails(),
    ),
    GoRoute(
      name: 'hot-place',
      path: '/hot-place',
      builder: (context, state) => GTHotPlace(),
    ),
  ],
);

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2)).then(
      (value) => {
        FlutterNativeSplash.remove(),
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        theme: GTTheme.lightTheme,
      );
}
