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
    required String icon,
    required Function press,
    Color? iconColor,
    Color? btnColor,
    double? iconWidth,
    double? iconHeight,
    double? paddingRight,
    double? paddingLeft,
  }) = _GTButtonIcon;

  const factory GTButton.text({
    required String text,
    required Function press,
  }) = _GTButtonText;

  const factory GTButton.textHighlight({
    required String text,
    required Function press,
  }) = _GTButtonTextHighlight;

  const factory GTButton.normal({
    required String text,
    required String icon,
    required Function press,
  }) = _GTElevatedButton;

  const factory GTButton.highlight({
    required String text,
    required Function press,
  }) = _GTElevatedButtonHighlight;

  const factory GTButton.highlightNonShadow({
    required String text,
    required Function press,
  }) = _GTElevatedButtonNonShadow;

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

class _GTButtonText extends GTButton {
  const _GTButtonText({
    required super.press,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: ColorName.backgroundColor,
      highlightColor: ColorName.backgroundColor,
      splashColor: ColorName.backgroundColor,
      onTap: press as Function(),
      child: GTText.bodyMedium(
        context,
        text,
        color: ColorName.tagColor,
      ),
    );
  }
}

class _GTButtonTextHighlight extends GTButton {
  const _GTButtonTextHighlight({
    required super.press,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: ColorName.backgroundColor,
      highlightColor: ColorName.backgroundColor,
      splashColor: ColorName.backgroundColor,
      onTap: press as Function(),
      child: GTText.labelSmall(
        context,
        text,
        color: ColorName.primaryColor,
      ),
    );
  }
}

class _GTElevatedButton extends GTButton {
  const _GTElevatedButton({
    required super.press,
    required this.text,
    required this.icon,
  });

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorName.shadowBtnLoginGoogleColor,
            blurRadius: 11,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          backgroundColor: ColorName.backgroundColor,
        ),
        onPressed: press as Function(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 20,
              width: 26,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 5,
            ),
            GTText.titleSmall(context, text),
          ],
        ),
      ),
    );
  }
}

class _GTElevatedButtonHighlight extends GTButton {
  const _GTElevatedButtonHighlight({
    required super.press,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorName.shadowBtnPrimaryColor,
            blurRadius: 11,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          backgroundColor: ColorName.primaryColor,
        ),
        onPressed: press as Function(),
        child: Container(
          alignment: Alignment.center,
          child: GTText.titleSmall(
            context,
            text,
            color: ColorName.onPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class _GTElevatedButtonNonShadow extends GTButton {
  const _GTElevatedButtonNonShadow({
    required super.press,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          backgroundColor: ColorName.primaryColor,
        ),
        onPressed: press as Function(),
        child: Container(
          alignment: Alignment.center,
          child: GTText.bodyLarge(
            context,
            text,
            color: ColorName.onPrimaryColor,
          ),
        ),
      ),
    );
  }
}
