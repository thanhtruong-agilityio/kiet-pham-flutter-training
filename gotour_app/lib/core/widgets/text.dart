import 'dart:html';

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
    double height = 1.261,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .displayMedium!
          .copyWith(height: height, color: color),
    );
  }

  factory GTText.displaySmall(
    BuildContext context,
    String text, {
    Color? color,
    double height = 1.266,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(height: height, color: color),
    );
  }

  factory GTText.titleLarge(
    BuildContext context,
    String text, {
    Color? color,
    double height = 1.269,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(height: height, color: color),
    );
  }

  factory GTText.TitleMedium(
    BuildContext context,
    String text, {
    Color? color,
    double height = 1.222,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(height: height, color: color),
    );
  }

  factory GTText.titleSmall(
    BuildContext context,
    String text, {
    Color? color,
    double height = 1.25,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(height: height, color: color),
    );
  }

  factory GTText.labelMedium(
    BuildContext context,
    String text, {
    Color? color,
    double height = 1.187,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(height: height, color: color),
    );
  }

  factory GTText.labelSmall(
    BuildContext context,
    String text, {
    Color? color,
    double height = 1.23,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(height: height, color: color),
    );
  }

  factory GTText.bodyLarge(
    BuildContext context,
    String text, {
    Color? color,
    double height = 1.272,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(height: height, color: color),
    );
  }

  factory GTText.bodyMedium(
    BuildContext context,
    String text, {
    Color? color,
    double height = 1.636,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(height: height, color: color),
    );
  }

  factory GTText.bodySmall(
    BuildContext context,
    String text, {
    Color? color,
    double height = 1.2,
  }) {
    return GTText(
      text: text,
      textStyle: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(height: height, color: color),
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
