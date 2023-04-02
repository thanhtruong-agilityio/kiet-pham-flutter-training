import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:shimmer/shimmer.dart';

class GTLocationPage extends StatelessWidget {
  const GTLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Shimmer.fromColors(
        baseColor: colorScheme.surfaceTint,
        highlightColor: colorScheme.primary,
        child: GTText.labelLarge(
          context,
          text: 'Coming soon...',
        ),
      ),
    );
  }
}
