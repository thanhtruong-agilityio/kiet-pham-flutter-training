import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_widgetbook/core/widgets/coppy_button.dart';

class CodeView extends StatefulWidget {
  const CodeView({
    super.key,
    required this.title,
    required this.code,
  });

  final String code;
  final String title;

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GTText.titleSmall(
              context,
              text: widget.title,
            ),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return GTTextButton(
                  text: _isVisible ? 'hide code' : 'show code',
                  onPressed: _toggleVisibility,
                );
              },
            ),
          ],
        ),
        Visibility(
          visible: _isVisible,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GTText.bodyLarge(context, text: widget.code),
              const Spacer(),
              CopyButton(text: widget.code),
            ],
          ),
        ),
      ],
    );
  }
}
