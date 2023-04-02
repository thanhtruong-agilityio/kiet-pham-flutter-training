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
import 'package:gotour_app/features/location/location_page.dart';
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
      state.namedLocation('location'),
      state.namedLocation('profile'),
    ];
    final unAuthenList = [
      state.namedLocation('login-page'),
      state.namedLocation('sign-up-page'),
      state.namedLocation('forgot-password-page'),
    ];
    final auth = FirebaseAuth.instance;
    final isLoggedIn =
        auth.currentUser != null && auth.currentUser!.emailVerified;
    final googleUser = GoogleSignIn().currentUser != null;
    // final isLoggedIn = authFirebase || googleUser;
    if (isLoggedIn && mainList.contains(state.subloc)) {
      return null;
    }
    if (googleUser && mainList.contains(state.subloc)) {
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
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const GTHomePage(),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          name: 'tour-details',
          path: '/tour-details/:id',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: GTTourDetails(
              id: state.params['id']!,
            ),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          name: 'best-place',
          path: '/best-place',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const GTBestPlacePage(),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          name: 'hot-place',
          path: '/hot-place/:id',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: GTHotPlace(
              id: state.params['id']!,
            ),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          name: 'chat',
          path: '/chat',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const GTChatPage(),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          name: 'notifications',
          path: '/notifications',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const GTNotificationPage(),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          name: 'location',
          path: '/location',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const GTLocationPage(),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          name: 'profile',
          path: '/profile',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const GTProfilePage(),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          ),
        ),
      ],
      builder: (context, state, child) => DashBoardScreen(body: child),
    ),
    GoRoute(
      name: 'onaboarding',
      path: '/onboarding',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const GTOnboardingScreen(),
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: 'login-page',
      path: '/login-page',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const GTLoginPage(),
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: 'forgot-password-page',
      path: '/forgot-password-page',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const GTForgotPasswordPage(),
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: 'sign-up-page',
      path: '/sign-up-page',
      pageBuilder: (context, state) => CustomTransitionPage(
        child: const GTSignUpPage(),
        transitionDuration: const Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      ),
    ),
  ],
);
