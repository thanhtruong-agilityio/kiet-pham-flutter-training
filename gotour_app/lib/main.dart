import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';

import 'package:gotour_app/core/theme/theme.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/auth/forgot_password/forgot_password_page.dart';
import 'package:gotour_app/features/auth/login/login_page.dart';
import 'package:gotour_app/features/auth/repository/auth_repository.dart';
import 'package:gotour_app/features/auth/sign_up/sign_up.dart';
import 'package:gotour_app/features/hot_place/hot_place_page.dart';
import 'package:gotour_app/features/main/main_page.dart';
import 'package:gotour_app/features/misc/onboarding_page.dart';
import 'package:gotour_app/features/tour_details/tour_details_page.dart';
import 'package:gotour_app/firebase_options.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const String title = 'Kiet Anh';

  @override
  State<MyApp> createState() => _MyAppState();
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              FirebaseAuth.instance.currentUser!.emailVerified == true) {
            return const GTMainPage();
          }
          return const GTOnboardingScreen();
        },
      ),
    ),
    GoRoute(
      path: '/login-page',
      builder: (context, state) => const GTLoginPage(),
    ),
    GoRoute(
      path: '/forgot-password-page',
      builder: (context, state) => const GTForgotPasswordPage(),
    ),
    GoRoute(
      path: '/sign-up-page',
      builder: (context, state) => const GTSignUpPage(),
    ),
    GoRoute(
      name: 'main',
      path: '/main-page',
      builder: (context, state) => const GTMainPage(),
      routes: [
        GoRoute(
          name: 'tour-details',
          path: 'tour-details',
          builder: (context, state) => const GTTourDetails(),
        ),
        GoRoute(
          name: 'hot-place',
          path: 'hot-place',
          builder: (context, state) => const GTHotPlace(),
        ),
      ],
    ),
  ],
);

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      FlutterNativeSplash.remove,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp.router(
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
          darkTheme: GTTheme.darkTheme,
        ),
      ),
    );
  }
}
