import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: GTText.labelMedium(
                  context,
                  text: message,
                  color: colorScheme.background,
                ),
              ),
            ],
          ),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
