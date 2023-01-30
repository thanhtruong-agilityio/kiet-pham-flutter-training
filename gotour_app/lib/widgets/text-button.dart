import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';

class GTTextButton extends StatelessWidget {
  const GTTextButton({
    super.key,
    required this.press,
    required this.title,
  });

  final Function press;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: ColorName.backgroundColor,
      highlightColor: ColorName.backgroundColor,
      splashColor: ColorName.backgroundColor,
      onTap: press as Function(),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: ColorName.primaryColor),
      ),
    );
  }
}
