import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/button.dart';

import 'text.dart';

class GTTitleAndSeeAllBtn extends StatelessWidget {
  const GTTitleAndSeeAllBtn({
    Key? key,
    required this.title,
    this.press,
  }) : super(key: key);

  final String title;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GTText.SubTitle(context, title),
        const Spacer(),
        GTTextButton(
          press: press as Function(),
          color: ColorName.tagColor,
          text: GTText.SeeAllButton(context, 'See All'),
        )
      ],
    );
  }
}
