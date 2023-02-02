import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotour_app/gen/assets.gen.dart';
import 'package:gotour_app/gen/colors.gen.dart';

class GTTitleWithLocation extends StatelessWidget {
  const GTTitleWithLocation({
    Key? key,
    required this.namePlace,
    required this.location,
  }) : super(key: key);

  final String namePlace, location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          namePlace,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset(
              Assets.icons.location,
              color: ColorName.primaryColor,
              width: 10,
              height: 12,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              location,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ColorName.iconsColor,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
