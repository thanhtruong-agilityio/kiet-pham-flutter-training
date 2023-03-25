import 'package:flutter/material.dart';

class GTSignUpLayout extends StatelessWidget {
  const GTSignUpLayout({
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
              padding: const EdgeInsets.only(top: 46),
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
                top: 74,
                left: 20,
                right: 20,
                bottom: 55,
              ),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
