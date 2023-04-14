import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/router/named_location.dart';
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
import 'package:gotour_ui/core/widgets/dashboard.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  redirect: (context, state) {
    final unAuthenList = [
      state.namedLocation(RouterNamedLocation.login),
      state.namedLocation(RouterNamedLocation.signUp),
      state.namedLocation(RouterNamedLocation.forgotPassword),
    ];

    final currentUser = FirebaseAuth.instance.currentUser != null;

    if (unAuthenList.contains(state.subloc)) {
      return null;
    }
    if (!currentUser) {
      return state.namedLocation(RouterNamedLocation.onboarding);
    }
    return null;
  },
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      routes: [
        GoRoute(
          name: RouterNamedLocation.home,
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
          name: RouterNamedLocation.tourDetails,
          path: '/tour-details/:id',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: GTTourDetail(
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
          name: RouterNamedLocation.bestPlace,
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
          name: RouterNamedLocation.hotPlace,
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
          name: RouterNamedLocation.chat,
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
          name: RouterNamedLocation.notification,
          path: '/notification',
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
          name: RouterNamedLocation.location,
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
          name: RouterNamedLocation.profile,
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
      name: RouterNamedLocation.onboarding,
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
      name: RouterNamedLocation.login,
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
      name: RouterNamedLocation.forgotPassword,
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
      name: RouterNamedLocation.signUp,
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
