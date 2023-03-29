import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTTitle extends StatelessWidget {
  const GTTitle({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GTText.titleMedium(
          context,
          text: title,
        ),
        const Spacer(),
        GTTextButton(
          onPressed: onPressed!,
          text: 'See All',
        )
      ],
    );
  }
}
