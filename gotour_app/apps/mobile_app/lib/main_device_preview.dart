import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app/core/resources/l10n_generated/l10n.dart';
import 'package:mobile_app/core/router/router.dart';
import 'package:mobile_app/core/theme/theme.dart';
import 'package:mobile_app/features/auth/bloc/auth_bloc.dart';
import 'package:mobile_app/features/auth/login/login_page.dart';
import 'package:mobile_app/features/auth/repository/auth_repository.dart';
import 'package:mobile_app/features/auth/sign_up/sign_up.dart';
import 'package:mobile_app/features/hot_place/hot_place_page.dart';
import 'package:mobile_app/features/main/main_page.dart';
import 'package:mobile_app/features/misc/onboarding_page.dart';
import 'package:mobile_app/features/tour_details/tour_details_page.dart';
import 'package:mobile_app/firebase_options.dart';
import 'package:mobile_app/main.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const String title = 'Kiet Anh';

  @override
  State<MyApp> createState() => _MyAppState();
}

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
          builder: DevicePreview.appBuilder,
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: GTTheme.lightTheme,
          darkTheme: GTTheme.darkTheme,
          useInheritedMediaQuery: true,
        ),
      ),
    );
  }
}


// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(const Duration(seconds: 2)).then(
//       (value) => {
//         FlutterNativeSplash.remove(),
//       },
//     );
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) => MaterialApp.router(
//         locale: const Locale('en', 'US'),
//         localizationsDelegates: const [
//           S.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: S.delegate.supportedLocales,
//         debugShowCheckedModeBanner: false,
//         routerDelegate: _router.routerDelegate,
//         routeInformationParser: _router.routeInformationParser,
//         theme: GTTheme.lightTheme,
//       );
// }
