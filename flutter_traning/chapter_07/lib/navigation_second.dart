import 'package:chapter_07/navigation_first.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation second screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  color = Colors.red[700]!;
                  Navigator.pop(context, color);
                },
                child: Text('Red'),
              ),
              ElevatedButton(
                child: Text('Green'),
                onPressed: () {
                  color = Colors.green[700]!;
                  // Navigator.pop(context, color);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationFirst()));
                },
              ),
              ElevatedButton(
                child: Text('Blue'),
                onPressed: () {
                  color = Colors.blue[700]!;
                  Navigator.pop(context, color);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
