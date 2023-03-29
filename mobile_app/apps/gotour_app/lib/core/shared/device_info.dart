import 'package:flutter/material.dart';

class GTReponsive {
  GTReponsive.of(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  double sizeOf(double value) {
    return screenWidth * value / mockupWidth;
  }

  double sw(double value) {
    return screenWidth * value / mockupWidth;
  }

  double sh(double value) {
    return screenHeight * value / mockupHeight;
  }

  // Width and height of design
  final mockupWidth = 375;
  final mockupHeight = 812;

  late double screenWidth;
  late double screenHeight;
}
