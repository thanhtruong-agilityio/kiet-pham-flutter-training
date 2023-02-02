import 'package:flutter/material.dart';
import 'package:gotour_app/gen/colors.gen.dart';
import 'package:gotour_app/widgets/title.dart';
import 'package:gotour_app/widgets/text-button.dart';

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
      children: [
        GTTitle(
          title: title,
        ),
        Spacer(),
        GTTextButton(
          press: press as Function(),
          color: ColorName.tagColor,
          text: Text(
            'See all',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
        )
      ],
    );
  }
}
