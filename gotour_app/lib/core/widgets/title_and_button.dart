import 'package:flutter/material.dart';
import 'package:gotour_app/core/widgets/button.dart';

import 'package:gotour_app/core/widgets/text.dart';

class GTTitleAndSeeAllBtn extends StatelessWidget {
  const GTTitleAndSeeAllBtn({
    super.key,
    required this.title,
    this.onPress,
  });

  final String title;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GTText.titleMedium(context, title),
        const Spacer(),
        GTButton.text(
          onPress: onPress!,
          text: 'See All',
        )
      ],
    );
  }
}
