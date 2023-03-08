import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTAlertDialog extends StatelessWidget {
  const GTAlertDialog({
    super.key,
    required this.onPressCancel,
    required this.onPressYes,
    required this.title,
    required this.content,
  });

  final VoidCallback onPressCancel;
  final VoidCallback onPressYes;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: GTText.titleSmall(context, text: title),
      content: GTText.labelMedium(context, text: content),
      actions: [
        CupertinoDialogAction(
          onPressed: onPressCancel,
          child: GTText.labelMedium(
            context,
            text: 'Cancel',
          ),
        ),
        CupertinoDialogAction(
          onPressed: onPressYes,
          child: GTText.labelMedium(
            context,
            text: 'Yes',
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ],
    );
  }
}
