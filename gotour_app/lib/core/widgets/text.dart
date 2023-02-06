import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../resources/assets_generated/colors.gen.dart';

class GTText extends StatelessWidget {
  const GTText({
    super.key,
    this.text,
    this.textStyle,
  });

  final String? text;
  final TextStyle? textStyle;

  factory GTText.TitleOnboarding(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle:
          Theme.of(context).textTheme.displayMedium!.copyWith(height: 1.261),
    );
  }

  factory GTText.TextOnboarding(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(height: 1.187, color: ColorName.iconsColor),
    );
  }

  factory GTText.TitleLoginPage(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle:
          Theme.of(context).textTheme.displaySmall!.copyWith(height: 1.266),
    );
  }

  factory GTText.TitleTextField(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(height: 1.187, color: ColorName.titleOfTextfieldColor),
    );
  }

  factory GTText.TitleMainPage(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle:
          Theme.of(context).textTheme.titleLarge!.copyWith(height: 1.269),
    );
  }

  factory GTText.SubTitle(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle:
          Theme.of(context).textTheme.titleMedium!.copyWith(height: 1.222),
    );
  }

  factory GTText.PlaceName(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(height: 1.25, color: color),
    );
  }

  factory GTText.PlaceLocation(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(height: 1.23, color: color),
    );
  }

  factory GTText.PlaceDescription(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(height: 1.636, color: ColorName.iconsColor),
    );
  }

  factory GTText.SeeAllButton(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(height: 1.181, color: ColorName.tagColor),
    );
  }

  factory GTText.NameTag(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(height: 1.2, color: ColorName.onTag),
    );
  }

  factory GTText.TitleLarge(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.titleLarge,
    );
  }

  factory GTText.TitleMedium(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.titleMedium,
    );
  }

  factory GTText.TitleSmall(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.titleSmall,
    );
  }

  factory GTText.LabelMedium(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.labelMedium,
    );
  }

  factory GTText.LabelSmall(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.labelSmall,
    );
  }

  factory GTText.BodyLarge(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.bodyLarge,
    );
  }

  factory GTText.BodyMedium(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: ColorName.backgroundColor,
            height: 1.272,
          ),
    );
  }

  factory GTText.BodySmall(
    BuildContext context,
    String text,
  ) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.bodySmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: textStyle,
    );
  }
}
