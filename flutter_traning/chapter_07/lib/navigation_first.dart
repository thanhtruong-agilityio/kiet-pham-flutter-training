import 'package:flutter/material.dart';

import 'navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color? color = Colors.blue[700];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('Navigation first screen'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            child: Text('Change color'),
            onPressed: () {
              _navigateAndGetColor(context);
            },
          ),
        ),
      ),
    );
  }

  void _navigateAndGetColor(BuildContext context) async {
    color = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationSecond()),
    );
    setState(() {
      color = color;
    });
  }
}
