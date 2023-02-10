import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/widgets/text.dart';

import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';

class GTButton extends StatelessWidget {
  const GTButton({
    Key? key,
    this.child,
    required this.onPress,
  }) : super(key: key);

  final Widget? child;
  final Function onPress;

  const factory GTButton.icon({
    required String icon,
    required Function onPress,
    Color? iconColor,
    Color? btnColor,
  }) = _GTButtonIcon;

  const factory GTButton.text({
    required String text,
    required Function onPress,
  }) = _GTButtonText;

  const factory GTButton.textHighlight({
    required String text,
    required Function onPress,
  }) = _GTButtonTextHighlight;

  const factory GTButton.normal({
    required String text,
    required String icon,
    required Function onPress,
  }) = _GTElevatedButton;

  factory GTButton.highlight({
    required String text,
    required Function onPress,
    bool? activateShadow,
  }) = _GTElevatedButtonHighlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class _GTButtonIcon extends GTButton {
  const _GTButtonIcon({
    required this.icon,
    required super.onPress,
    this.heroTag,
    this.iconColor,
    this.btnColor = ColorName.primaryColor,
  });

  final String icon;
  final Color? iconColor, btnColor;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress as Function(),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: btnColor,
        ),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.scaleDown,
          color: iconColor,
        ),
      ),
    );
  }
}

class _GTButtonText extends GTButton {
  const _GTButtonText({
    required super.onPress,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: ColorName.backgroundColor,
      highlightColor: ColorName.backgroundColor,
      splashColor: ColorName.backgroundColor,
      onTap: onPress as Function(),
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
    required super.onPress,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: ColorName.backgroundColor,
      highlightColor: ColorName.backgroundColor,
      splashColor: ColorName.backgroundColor,
      onTap: onPress as Function(),
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
    required super.onPress,
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
            offset: Offset(1, 5),
            blurRadius: 15,
            spreadRadius: 3,
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
        onPressed: onPress as Function(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                icon,
                height: 20,
                fit: BoxFit.cover,
              ),
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
  _GTElevatedButtonHighlight({
    required super.onPress,
    required this.text,
    this.activateShadow = false,
  });

  final String text;
  final bool? activateShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: activateShadow == true
          ? const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorName.shadowBtnPrimaryColor,
                  offset: Offset(0, 5),
                  blurRadius: 11,
                ),
              ],
            )
          : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          backgroundColor: ColorName.primaryColor,
        ),
        onPressed: onPress as Function(),
        child: Container(
          alignment: Alignment.center,
          child: activateShadow == true
              ? GTText.titleSmall(
                  context,
                  text,
                  color: ColorName.onPrimaryColor,
                )
              : GTText.bodyLarge(
                  context,
                  text,
                  color: ColorName.backgroundColor,
                ),
        ),
      ),
    );
  }
}
