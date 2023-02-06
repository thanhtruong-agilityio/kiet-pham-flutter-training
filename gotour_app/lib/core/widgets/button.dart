import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/widgets/text.dart';

import '../resources/assets_generated/colors.gen.dart';

class GTButtonIcon extends StatelessWidget {
  const GTButtonIcon({
    super.key,
    required this.icon,
    required this.press,
    this.iconColor,
    this.btnColor,
    this.iconWidth = 20,
    this.iconHeight = 20,
    this.paddingRight = 0,
    this.paddingLeft = 0,
  });

  final String icon;
  final Color? iconColor, btnColor;
  final double? iconWidth, iconHeight, paddingRight, paddingLeft;
  final Function press;

  factory GTButtonIcon.IsActive({
    required final String icon,
    final Color iconColor = ColorName.onPrimaryColor,
    final Color btnColor = ColorName.primaryColor,
    required final Function press,
    final double iconWidth = 20,
    final double iconHeight = 20,
    final double paddingRight = 0,
    final double paddingLeft = 0,
  }) {
    return GTButtonIcon(
      icon: icon,
      press: press,
      iconColor: iconColor,
      btnColor: btnColor,
      iconHeight: iconHeight,
      iconWidth: iconWidth,
      paddingLeft: paddingLeft,
      paddingRight: paddingRight,
    );
  }

  factory GTButtonIcon.NonActive({
    required final String icon,
    required final Function press,
    final Color iconColor = ColorName.iconsColor,
    final Color btnColor = ColorName.surfaceColor,
    final double iconWidth = 20,
    final double iconHeight = 20,
    final double paddingRight = 0,
    final double paddingLeft = 0,
  }) {
    return GTButtonIcon(
      icon: icon,
      press: press,
      iconColor: iconColor,
      btnColor: btnColor,
      iconHeight: iconHeight,
      iconWidth: iconWidth,
      paddingLeft: paddingLeft,
      paddingRight: paddingRight,
    );
  }

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
          padding: EdgeInsets.only(
            right: paddingRight!,
            left: paddingLeft!,
          ),
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

class GTTextButton extends StatelessWidget {
  const GTTextButton({
    super.key,
    required this.press,
    required this.text,
    required this.color,
  });

  final Function press;
  final Widget text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: ColorName.backgroundColor,
      highlightColor: ColorName.backgroundColor,
      splashColor: ColorName.backgroundColor,
      onTap: press as Function(),
      child: text,
    );
  }
}

class GTElevatedButton extends StatelessWidget {
  GTElevatedButton({
    super.key,
    this.shadowColor,
    this.activeIcon = false,
    required this.activateShadowColor,
    this.icon,
    required this.text,
    required this.press,
    this.colorButton,
  });
  final Color? shadowColor, colorButton;
  final String? icon;
  final Widget text;
  final Function press;
  bool activeIcon, activateShadowColor;

  factory GTElevatedButton.Normal(
    BuildContext context, {
    required String title,
    required Function press,
    required String icon,
  }) {
    return GTElevatedButton(
      activateShadowColor: true,
      colorButton: ColorName.backgroundColor,
      shadowColor: ColorName.shadowBtnLoginGoogleColor,
      activeIcon: true,
      icon: icon,
      text: GTText.titleSmall(context, title),
      press: press,
    );
  }

  factory GTElevatedButton.Highlight(
    BuildContext context, {
    required String title,
    required Function press,
  }) {
    return GTElevatedButton(
      activateShadowColor: true,
      shadowColor: ColorName.shadowBtnPrimaryColor,
      text: GTText.titleSmall(context, title),
      press: press,
    );
  }

  factory GTElevatedButton.Price(
    BuildContext context, {
    required String title,
    required Function press,
  }) {
    return GTElevatedButton(
      activateShadowColor: false,
      text: GTText.bodyLarge(
        context,
        title,
        color: ColorName.backgroundColor,
      ),
      press: press,
    );
  }

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
          backgroundColor: colorButton,
        ),
        onPressed: press as Function(),
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
