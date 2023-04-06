import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:go_router/go_router.dart';

class GTAlertDialog extends StatelessWidget {
  const GTAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.onCancel,
    this.onOk,
  });

  final VoidCallback? onCancel;
  final VoidCallback? onOk;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final i10n = S.of(context);

    return CupertinoAlertDialog(
      title: GTText.titleSmall(context, text: title),
      content: GTText.labelMedium(context, text: content),
      actions: [
        CupertinoDialogAction(
          onPressed: onCancel ??
              () {
                context.pop();
              },
          child: GTText.labelMedium(
            context,
            text: i10n.cancel,
          ),
        ),
        CupertinoDialogAction(
          onPressed: onOk ??
              () {
                context.pop();
              },
          child: GTText.labelMedium(
            context,
            text: i10n.yes,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ],
    );
  }
}
