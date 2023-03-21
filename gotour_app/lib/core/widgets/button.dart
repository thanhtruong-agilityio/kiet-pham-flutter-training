import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTIconButton extends StatelessWidget {
  const GTIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.btnColor,
  });

  final String icon;
  final Color? iconColor;
  final Color? btnColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 40,
      height: 40,
      child: FloatingActionButton(
        heroTag: '',
        elevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        backgroundColor: btnColor ?? colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onPressed: onPressed,
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

class GTTextButton extends StatelessWidget {
  const GTTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      hoverColor: colorScheme.background,
      highlightColor: colorScheme.background,
      splashColor: colorScheme.background,
      onTap: onPressed,
      child: GTText.bodyMedium(
        context,
        text: text,
        color: colorScheme.onSecondaryContainer,
      ),
    );
  }
}

class GTTextHighlightButton extends StatelessWidget {
  const GTTextHighlightButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      hoverColor: colorScheme.background,
      highlightColor: colorScheme.background,
      splashColor: colorScheme.background,
      onTap: onPressed,
      child: GTText.labelMedium(
        context,
        text: text,
        color: colorScheme.primary,
      ),
    );
  }
}

class GTElevatedButton extends StatelessWidget {
  const GTElevatedButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
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
          backgroundColor: colorScheme.background,
        ),
        onPressed: onPressed,
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
            GTText.titleSmall(
              context,
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}

class GTElevatedHighlightButton extends StatelessWidget {
  const GTElevatedHighlightButton({
    super.key,
    required this.text,
    this.activateShadow = false,
    required this.onPressed,
  });

  final String text;
  final bool activateShadow;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: activateShadow == true
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: colorScheme.inversePrimary,
                  offset: const Offset(0, 5),
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
          backgroundColor: colorScheme.primary,
        ),
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          child: activateShadow == true
              ? GTText.titleSmall(
                  context,
                  text: text,
                  color: colorScheme.onPrimary,
                )
              : GTText.bodyLarge(
                  context,
                  text: text,
                  color: colorScheme.onPrimary,
                ),
        ),
      ),
    );
  }
}
