import 'package:chapter_05/login_screen.dart';
import 'package:flutter/material.dart';

import 'stopwatch.dart';

void main() {
  runApp(const StopwatchApp());
}

class StopwatchApp extends StatelessWidget {
  const StopwatchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        StopWatch.route: (context) => StopWatch(),
      },
      initialRoute: '/',
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: LoginScreen(),
    );
  }
}
