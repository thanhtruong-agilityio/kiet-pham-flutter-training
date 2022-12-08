import 'package:chapter_04/deep_tree.dart';
import 'package:chapter_04/e_commerce_screen_before.dart';
import 'package:chapter_04/flex_screen.dart';
import 'package:chapter_04/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          elevation: 10,
          textTheme: TextTheme(
            headline6: TextStyle(fontFamily: 'LeckerliOne', fontSize: 24),
          ),
        ),
      ),
      home: ECommerceScreen(),
    );
  }
}
