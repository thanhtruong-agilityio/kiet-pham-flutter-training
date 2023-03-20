import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/features/auth/forgot_password/forgot_password_page.dart';
import 'package:gotour_app/features/auth/login/login_page.dart';
import 'package:gotour_app/features/auth/sign_up/sign_up.dart';
import 'package:gotour_app/features/hot_place/hot_place_page.dart';
import 'package:gotour_app/features/main/main_page.dart';
import 'package:gotour_app/features/misc/onboarding_page.dart';
import 'package:gotour_app/features/tour_details/tour_details_page.dart';

final GoRouter router = GoRouter(
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
