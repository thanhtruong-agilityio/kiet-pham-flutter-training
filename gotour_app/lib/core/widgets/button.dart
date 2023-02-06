import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/widgets/text.dart';

import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';

class GTButton extends StatelessWidget {
  const GTButton({
    Key? key,
    this.child,
    required this.press,
  }) : super(key: key);

  final Widget? child;
  final Function press;

  const factory GTButton.icon({
    required Function press,
    required String icon,
    Color? iconColor,
    Color? btnColor,
    double? iconWidth,
    double? iconHeight,
    double? paddingRight,
    double? paddingLeft,
  }) = _GTButtonIcon;

  // const factory GTButton.text() = ButtonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class _GTButtonIcon extends GTButton {
  const _GTButtonIcon({
    required super.press,
    required this.icon,
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

  @override
  Widget build(Object context) {
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
    this.activateShadowColor,
    this.icon,
    required this.text,
    required this.press,
    this.colorButton,
  });
  final Color? shadowColor, colorButton;
  final String? icon;
  final Widget text;
  final Function press;
  bool? activeIcon, activateShadowColor;

  factory GTElevatedButton.normal(
    BuildContext context, {
    required String title,
    required Function press,
    required String icon,
    bool? activateShadowColor,
  }) {
    return GTElevatedButton(
      activateShadowColor: activateShadowColor,
      colorButton: ColorName.backgroundColor,
      shadowColor: ColorName.shadowBtnLoginGoogleColor,
      activeIcon: true,
      icon: icon,
      text: GTText.titleSmall(context, title),
      press: press,
    );
  }

  factory GTElevatedButton.highlight(
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

  factory GTElevatedButton.highlightNonShadow(
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
