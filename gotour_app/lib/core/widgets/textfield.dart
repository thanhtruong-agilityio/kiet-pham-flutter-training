import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';

import 'package:gotour_app/core/widgets/text.dart';

class GTTextField extends StatefulWidget {
  const GTTextField({
    super.key,
    required this.hintText,
    this.title,
    this.activateLabel = false,
    this.obscureText = false,
    this.keyboardType,
    this.autovalidateMode,
    this.validator,
    this.controller,
  });

  final String? title;
  final bool obscureText;
  final bool activateLabel;
  final String hintText;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<GTTextField> createState() => _GTTextFieldState();
}

class _GTTextFieldState extends State<GTTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.activateLabel == true)
          GTText.labelLarge(
            context,
            text: widget.title!,
            color: colorScheme.surfaceTint,
          ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 70,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            autovalidateMode: widget.autovalidateMode,
            // textAlignVertical: TextAlignVertical.bottom,
            style: Theme.of(context).textTheme.labelMedium,
            cursorColor: ColorName.textColor,
            obscureText: _obscureText,
            validator: widget.validator,
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              suffixIcon: widget.obscureText
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: _obscureText
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: ColorName.textColor,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: ColorName.textColor,
                            ),
                    )
                  : null,
              hintText: widget.hintText,
            ),
            // onChanged: widget.press as Function(String),
          ),
        ),
      ],
    );
  }
}
