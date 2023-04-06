import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gotour_app/core/firebase/firebase_options.dart';
// import 'package:gotour_app/core/firebase/firebase_options.dart';
import 'package:gotour_app/core/router/router.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/auth/repository/auth_repository.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/theme/theme.dart';

void main() async {
  //show splash screen
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // load key firebase
  await dotenv.load();

  // initializes the Firebase SDK
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(
    // provides the ability to preview the application on various devices.
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // remove splash screen after the 2-second delay,
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
