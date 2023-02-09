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

  factory GTText.displayMedium(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle:
          Theme.of(context).textTheme.displayMedium!.copyWith(color: color),
    );
  }

  factory GTText.displaySmall(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle:
          Theme.of(context).textTheme.displaySmall!.copyWith(color: color),
    );
  }

  factory GTText.titleLarge(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: color),
    );
  }

  factory GTText.TitleMedium(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle:
          Theme.of(context).textTheme.titleMedium!.copyWith(color: color),
    );
  }

  factory GTText.titleSmall(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: color),
    );
  }

  factory GTText.labelLarge(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(color: color),
    );
  }

  factory GTText.labelMedium(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle:
          Theme.of(context).textTheme.labelMedium!.copyWith(color: color),
    );
  }

  factory GTText.labelSmall(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: color),
    );
  }

  factory GTText.bodyLarge(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
    );
  }

  factory GTText.bodyMedium(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color),
    );
  }

  factory GTText.bodySmall(
    BuildContext context,
    String text, {
    Color? color,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: color),
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
