import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/button.dart';

class GTDetailTours extends StatelessWidget {
  const GTDetailTours({
    super.key,
    required this.namePlace,
    required this.location,
  });

  final String namePlace, location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(context),
            const SizedBox(
              height: 10,
            ),
            locationDetails(context),
            const SizedBox(height: 24),
            button(context),
          ],
        ),
        weather(context)
      ],
    );
  }

  SizedBox button(BuildContext context) {
    return SizedBox(
      height: 25,
      child: GTElevatedButton(
        activateShadowColor: false,
        text: Text(
          '\$3 000',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: ColorName.backgroundColor),
        ),
        press: () {},
      ),
    );
  }

  Row locationDetails(BuildContext context) {
    return Row(
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
    );
  }

  Text title(BuildContext context) {
    return Text(
      namePlace,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  Row weather(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.icons.cloud),
        SizedBox(width: 7),
        Text(
          '30°C',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: ColorName.iconsColor),
        ),
      ],
    );
  }
}
