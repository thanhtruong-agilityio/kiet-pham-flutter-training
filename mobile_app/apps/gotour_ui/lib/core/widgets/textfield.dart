import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/text.dart';

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
    this.onChanged,
  });

  final String? title;
  final bool obscureText;
  final bool activateLabel;
  final String hintText;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

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
            style: Theme.of(context).textTheme.labelMedium,
            cursorColor: colorScheme.onBackground,
            obscureText: _obscureText,
            validator: widget.validator,
            onChanged: widget.onChanged,
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
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: colorScheme.onBackground,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color: colorScheme.onBackground,
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
