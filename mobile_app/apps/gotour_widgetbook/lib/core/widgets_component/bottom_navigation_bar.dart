import 'package:flutter/material.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/widgets/bottom_navigation_bar.dart';

class WBBottomNavigationBar extends StatelessWidget {
  const WBBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: GTBottomNavigationBar(
        routes: const [],
        icons: [
          GTAssets.icHome,
          GTAssets.icBell,
          GTAssets.icChat,
          GTAssets.icLocation,
          GTAssets.icPerson,
        ],
      ),
    ));
  }
}
