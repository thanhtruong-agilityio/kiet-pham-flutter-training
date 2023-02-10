import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTTitleWithLocation extends StatelessWidget {
  const GTTitleWithLocation({
    Key? key,
    required this.placeName,
    required this.location,
    this.colorIcon,
    this.colorName,
    this.colorLocation,
  }) : super(key: key);

  final String placeName, location;
  final Color? colorIcon, colorName, colorLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GTText.titleSmall(
          context,
          placeName,
          color: colorName,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset(
              Assets.icons.location,
              color: colorIcon,
              width: 10,
              height: 12,
            ),
            const SizedBox(
              width: 10,
            ),
            GTText.labelMedium(
              context,
              location,
              color: colorLocation,
            ),
          ],
        ),
      ],
    );
  }
}
