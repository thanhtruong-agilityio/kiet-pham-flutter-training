import 'package:flutter/material.dart';

class GTText extends StatelessWidget {
  const GTText({
    super.key,
    this.text,
    this.textStyle,
    this.maxLines,
  });

  factory GTText.bodySmall(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: color),
    );
  }

  factory GTText.bodyMedium(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color),
    );
  }

  factory GTText.bodyLarge(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
    );
  }

  factory GTText.labelSmall(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: color),
    );
  }

  factory GTText.labelMedium(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle:
          Theme.of(context).textTheme.labelMedium!.copyWith(color: color),
    );
  }

  factory GTText.labelLarge(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(color: color),
    );
  }

  factory GTText.titleSmall(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: color),
    );
  }

  factory GTText.titleMedium(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle:
          Theme.of(context).textTheme.titleMedium!.copyWith(color: color),
    );
  }

  factory GTText.titleLarge(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: color),
    );
  }

  factory GTText.displaySmall(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle:
          Theme.of(context).textTheme.displaySmall!.copyWith(color: color),
    );
  }

  factory GTText.displayMedium(
    BuildContext context, {
    required String text,
    Color? color,
    int? maxLines,
  }) {
    return GTText(
      text: text,
      maxLines: maxLines,
      textStyle:
          Theme.of(context).textTheme.displayMedium!.copyWith(color: color),
    );
  }

  final String? text;
  final TextStyle? textStyle;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines,
      style: textStyle,
    );
  }
}
