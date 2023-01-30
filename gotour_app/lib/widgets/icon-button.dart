import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

class GTIconBtn extends StatelessWidget {
  const GTIconBtn({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.btnColor,
    required this.iconWidth,
    required this.iconHeight,
    required this.press,
    this.paddingRight = 0,
    this.paddingLeft = 0,
  });

  final String icon;
  final Color iconColor, btnColor;
  final double iconWidth, iconHeight, paddingRight, paddingLeft;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onPressed: press as Function(),
        child: Padding(
          padding: EdgeInsets.only(right: paddingRight, left: paddingLeft),
          child: SvgPicture.asset(
            icon,
            color: iconColor,
            width: iconWidth,
            height: iconHeight,
          ),
        ),
      ),
    );
  }
}
