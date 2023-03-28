import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/features/auth/forgot_password/forgot_password_page.dart';
import 'package:mobile_app/features/auth/login/login_page.dart';
import 'package:mobile_app/features/auth/sign_up/sign_up.dart';
import 'package:mobile_app/features/best_place/best_place_page.dart';
import 'package:mobile_app/features/chat/chat_page.dart';
import 'package:mobile_app/features/hot_place/hot_place_page.dart';
import 'package:mobile_app/features/main/main_page.dart';
import 'package:mobile_app/features/misc/onboarding_page.dart';
import 'package:mobile_app/features/notification/notification_page.dart';
import 'package:mobile_app/features/tour_details/tour_details_page.dart';

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
          path: 'tour-details/:id',
          builder: (context, state) => GTTourDetails(
            id: state.params['id'],
          ),
        ),
        GoRoute(
          name: 'best-place',
          path: 'best-place',
          builder: (context, state) => const GTBestPlacePage(),
        ),
        GoRoute(
          name: 'hot-place',
          path: 'hot-place',
          builder: (context, state) => const GTHotPlace(),
        ),
        GoRoute(
          name: 'chat',
          path: 'chat',
          builder: (context, state) => const GTChatPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const GTNotificationPage(),
    ),
  ],
);
