import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:go_router/go_router.dart';

class GTIndicatorOverlay {
  late bool isOverlay = false;

  void show(BuildContext context, String message) {
    if (isOverlay) {
      return;
    }

    isOverlay = true;
    showGeneralDialog(
      context: context,
      barrierColor: Theme.of(context).colorScheme.background,
      // barrierDismissible: false,
      barrierLabel: '',
      transitionDuration: const Duration(
        milliseconds: 100,
      ),
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child: Column(
            children: [
              const Spacer(),
              const GTIndicatorCircularProgress(),
              const SizedBox(height: 27),
              GTText.bodyLarge(context, text: message),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }

  void hide(BuildContext context) {
    if (!isOverlay) {
      return;
    }
    isOverlay = false;
    context.pop();
  }
}

class GTIndicatorCircularProgress extends StatelessWidget {
  const GTIndicatorCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

GTIndicatorOverlay gtIndicatorOverlay = GTIndicatorOverlay();
