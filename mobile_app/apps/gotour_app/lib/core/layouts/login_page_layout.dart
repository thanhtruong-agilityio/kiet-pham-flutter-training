import 'package:flutter/material.dart';

class GTLoginLayout extends StatelessWidget {
  const GTLoginLayout({
    super.key,
    required this.logo,
    required this.title,
    required this.body,
  });

  final Widget logo;
  final Widget title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 126),
              child: Column(
                children: [
                  logo,
                  Padding(
                    padding: const EdgeInsets.only(top: 72),
                    child: title,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 47,
                left: 20,
                right: 20,
                bottom: 76,
              ),
              child: body,
            )
          ],
        ),
      ),
    );
  }
}
