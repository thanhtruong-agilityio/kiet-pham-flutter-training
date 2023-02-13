import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTButton extends StatelessWidget {
  const GTButton({
    super.key,
    this.child,
    required this.onPress,
  });

  const factory GTButton.highlight({
    required String text,
    required VoidCallback onPress,
    bool activateShadow,
  }) = _GTElevatedButtonHighlight;

  const factory GTButton.normal({
    required String text,
    required String icon,
    required VoidCallback onPress,
  }) = _GTElevatedButton;

  const factory GTButton.textHighlight({
    required String text,
    required VoidCallback onPress,
  }) = _GTButtonTextHighlight;

  const factory GTButton.text({
    required String text,
    required VoidCallback onPress,
  }) = _GTButtonText;

  const factory GTButton.icon({
    required String icon,
    required VoidCallback onPress,
    Color? iconColor,
    Color? btnColor,
    Object? heroTag,
  }) = _GTButtonIcon;

  final Widget? child;
  final VoidCallback onPress;

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
  final Color? iconColor;
  final Color? btnColor;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: FloatingActionButton(
        heroTag: heroTag,
        elevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        backgroundColor: btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onPressed: onPress,
        child: SizedBox(
          height: 20,
          width: 30,
          child: SvgPicture.asset(
            icon,
            color: iconColor,
          ),
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
      onTap: onPress,
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
      onTap: onPress,
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
        onPressed: onPress,
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
  const _GTElevatedButtonHighlight({
    required super.onPress,
    required this.text,
    this.activateShadow = false,
  });

  final String text;
  final bool activateShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 5),
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
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          backgroundColor: ColorName.primaryColor,
        ),
        onPressed: onPress,
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
