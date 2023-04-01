import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gotour_app/core/shared/dashboard.dart';
import 'package:gotour_app/features/auth/forgot_password_page.dart';
import 'package:gotour_app/features/auth/login_page.dart';
import 'package:gotour_app/features/auth/sign_up_page.dart';
import 'package:gotour_app/features/best_place/best_place_page.dart';
import 'package:gotour_app/features/chat/chat_page.dart';
import 'package:gotour_app/features/home/home_page.dart';
import 'package:gotour_app/features/hot_place/hot_place_page.dart';
import 'package:gotour_app/features/misc/onboarding_page.dart';
import 'package:gotour_app/features/notification/notification_page.dart';
import 'package:gotour_app/features/profile/profile_page.dart';
import 'package:gotour_app/features/tour_details/tour_details_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  redirect: (context, state) {
    final mainList = [
      state.namedLocation('home'),
      state.namedLocation('best-place'),
      state.namedLocation('chat'),
      state.namedLocation('notifications'),
    ];
    final unAuthenList = [
      state.namedLocation('login-page'),
      state.namedLocation('sign-up-page'),
      state.namedLocation('forgot-password-page'),
    ];
    final auth = FirebaseAuth.instance;
    final isLoggedIn =
        auth.currentUser != null && auth.currentUser!.emailVerified;
    // final googleUser = GoogleSignIn().currentUser != null;
    // final isLoggedIn = authFirebase || googleUser;
    if (isLoggedIn && mainList.contains(state.subloc)) {
      return null;
    }
    if (unAuthenList.contains(state.subloc)) {
      return null;
    }
    if (!isLoggedIn) {
      return state.namedLocation('login-page');
      // return null;
    }
    return null;
  },
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => const GTHomePage(),
        ),
        GoRoute(
          name: 'tour-details',
          path: '/tour-details/:id',
          builder: (context, state) => GTTourDetails(
            id: state.params['id'],
          ),
        ),
        GoRoute(
          name: 'best-place',
          path: '/best-place',
          builder: (context, state) => const GTBestPlacePage(),
        ),
        GoRoute(
          name: 'hot-place',
          path: '/hot-place/:id',
          builder: (context, state) => GTHotPlace(
            id: state.params['id']!,
          ),
        ),
        GoRoute(
          name: 'chat',
          path: '/chat',
          builder: (context, state) => const GTChatPage(),
        ),
        GoRoute(
          name: 'notifications',
          path: '/notifications',
          builder: (context, state) => const GTNotificationPage(),
        ),
        GoRoute(
          name: 'profile',
          path: '/profile',
          builder: (context, state) => const GTProfilePage(),
        ),
      ],
      builder: (context, state, child) => DashBoardScreen(body: child),
    ),
    GoRoute(
      name: 'onaboarding',
      path: '/onboarding',
      builder: (context, state) => const GTOnboardingScreen(),
    ),
    GoRoute(
      name: 'login-page',
      path: '/login-page',
      builder: (context, state) => const GTLoginPage(),
    ),
    GoRoute(
      name: 'forgot-password-page',
      path: '/forgot-password-page',
      builder: (context, state) => const GTForgotPasswordPage(),
    ),
    GoRoute(
      name: 'sign-up-page',
      path: '/sign-up-page',
      builder: (context, state) => const GTSignUpPage(),
    ),
  ],
);
