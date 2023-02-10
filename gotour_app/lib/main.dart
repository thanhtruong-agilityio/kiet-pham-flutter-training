import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/theme.dart';
import 'core/widgets/text.dart';
import 'features/auth/login_page.dart';
import 'features/misc/onboarding-page.dart';

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
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        theme: GTTheme.lightTheme,
      );
}
