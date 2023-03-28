import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/bottom_navigation_bar.dart';

class GTScaffold extends StatelessWidget {
  const GTScaffold({
    super.key,
    required this.appBar,
    required this.body,
  });

  final PreferredSizeWidget appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: body),
      bottomNavigationBar: const SafeArea(child: GTBottomNavigationBar()),
    );
  }
}
