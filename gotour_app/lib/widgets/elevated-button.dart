import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

class GTElevatedButton extends StatelessWidget {
  GTElevatedButton({
    super.key,
    this.shadowColor,
    this.activeIcon = false,
    required this.activateShadowColor,
    this.icon,
    required this.text,
  });
  final Color? shadowColor;
  final String? icon;
  final Text text;
  bool activeIcon, activateShadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        boxShadow: activateShadowColor == true
            ? [
                BoxShadow(
                  color: shadowColor!,
                  blurRadius: 11,
                  offset: Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        onPressed: () {},
        child: activeIcon == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon!,
                    height: 20,
                    width: 26,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  text,
                ],
              )
            : Center(
                child: text,
              ),
      ),
    );
  }
}
