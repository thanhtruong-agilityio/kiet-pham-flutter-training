import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTSnackBar {
  static void success(
    BuildContext context, {
    required String message,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsetsDirectional.all(16),
        content: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          elevation: 6,
          child: Container(
            padding: const EdgeInsets.all(16),
            // height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: colorScheme.secondaryContainer,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GTText.labelMedium(
                    context,
                    text: message,
                    color: colorScheme.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void failure(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: const EdgeInsetsDirectional.all(16),
      content: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        elevation: 6,
        child: Container(
          padding: const EdgeInsets.all(16),
          // height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: colorScheme.error,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: GTText.labelMedium(
                  context,
                  text: message,
                  color: colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    ));
  }
}
