import 'package:flutter/material.dart';

import 'package:gotour_app/core/widgets/text.dart';

class GTTag extends StatelessWidget {
  const GTTag({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      height: 20,
      decoration: BoxDecoration(
        color: colorScheme.onSecondaryContainer,
        borderRadius: BorderRadius.circular(5),
      ),
      child: GTText.bodySmall(
        context,
        text: text,
        color: colorScheme.outline,
      ),
    );
  }
}
