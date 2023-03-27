import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/widgets/text.dart';

class GTAlertDialog extends StatelessWidget {
  const GTAlertDialog({
    super.key,
    required this.onCancel,
    required this.onOk,
    required this.title,
    required this.content,
  });

  final VoidCallback onCancel;
  final VoidCallback onOk;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: GTText.titleSmall(context, text: title),
      content: GTText.labelMedium(context, text: content),
      actions: [
        CupertinoDialogAction(
          onPressed: onCancel,
          child: GTText.labelMedium(
            context,
            text: 'Cancel',
          ),
        ),
        CupertinoDialogAction(
          onPressed: onOk,
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
