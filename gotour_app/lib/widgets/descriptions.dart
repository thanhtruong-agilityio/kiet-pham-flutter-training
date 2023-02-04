import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';

class GTDescriptions extends StatelessWidget {
  const GTDescriptions({
    super.key,
    required this.descriptions,
  });
  final String descriptions;

  @override
  Widget build(BuildContext context) {
    return Text(
      descriptions,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: ColorName.secondaryColor),
    );
  }
}
