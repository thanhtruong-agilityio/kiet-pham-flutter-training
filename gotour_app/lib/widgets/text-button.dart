import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';

class GTTextButton extends StatelessWidget {
  const GTTextButton({
    super.key,
    required this.press,
    required this.text,
    required this.color,
  });

  final Function press;
  final Text text;
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
