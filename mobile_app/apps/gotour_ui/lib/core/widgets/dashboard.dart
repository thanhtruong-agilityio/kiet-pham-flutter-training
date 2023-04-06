import 'package:flutter/material.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/widgets/bottom_navigation_bar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: GTBottomNavigationBar(
        routes: const [
          '/',
          '/notification',
          '/chat',
          '/location',
          '/profile',
        ],
        icons: [
          GTAssets.icHome,
          GTAssets.icBell,
          GTAssets.icChat,
          GTAssets.icLocation,
          GTAssets.icPerson,
        ],
      ),
    );
  }
}
