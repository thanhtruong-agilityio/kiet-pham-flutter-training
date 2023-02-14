import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTLocation extends StatelessWidget {
  const GTLocation({
    super.key,
    required this.placeName,
    required this.location,
    this.colorIcon,
    this.colorName,
    this.colorLocation,
  });

  final String placeName;
  final String location;
  final Color? colorIcon;
  final Color? colorName;
  final Color? colorLocation;

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
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: GTText.labelMedium(
                context,
                location,
                color: colorLocation,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
