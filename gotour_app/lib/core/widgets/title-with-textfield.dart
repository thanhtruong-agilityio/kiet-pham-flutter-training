import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';

import 'package:gotour_app/core/widgets/text.dart';

class GTTextField extends StatefulWidget {
  const GTTextField({
    super.key,
    required this.hintText,
    this.title,
    this.activateLabel = false,
    this.hideText = false,
  });

  final String? title;
  final bool hideText, activateLabel;
  final String hintText;

  @override
  State<GTTextField> createState() => _GTTextFieldState();
}

class _GTTextFieldState extends State<GTTextField> {
  bool _passWis = false;

  @override
  void initState() {
    super.initState();
    _passWis = widget.hideText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.activateLabel == true)
            GTText.labelLarge(
              context,
              widget.title!,
              color: ColorName.titleOfTextfieldColor,
            )
          else
            const SizedBox(),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 40,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
              cursorColor: ColorName.textColor,
              obscureText: _passWis,
              decoration: InputDecoration(
                suffixIcon: widget.hideText
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _passWis = !_passWis;
                          });
                        },
                        child: _passWis
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
      ),
    );
  }
}
