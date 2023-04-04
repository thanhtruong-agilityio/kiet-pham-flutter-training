import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotour_ui/core/widgets/snack_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return GTTextButton(
      text: 'Copy',
      onPressed: () {
        Clipboard.setData(ClipboardData(text: text));
        GTSnackBar.success(
          context,
          message: 'Copied to clipboard',
        );
      },
    );
  }
}
