import 'package:chapter_06/plan_provider.dart';
import 'package:flutter/material.dart';

import 'views/plan_creator_screen.dart';
import 'views/plan_screen.dart';

void main() {
  runApp(PlanProvider(child: MasterPlanApp()));
}

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: PlanProvider(
        child: PlanCreatorScreen(),
      ),
    );
  }
}
