import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';

class GTTextField extends StatefulWidget {
  const GTTextField({
    super.key,
    // required this.obscureText,
    required this.hintText,
    required this.title,
    required this.hideText,
    required this.press,
  });

  final String title;
  final bool hideText;
  final String hintText;
  final Function press;

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
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: ColorName.titleOfTextfieldColor,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontWeight: FontWeight.w400, height: 1.7),
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
                              Icons.visibility_off,
                              color: ColorName.textColor,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: ColorName.textColor,
                            ),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.5,
                  color: ColorName.borderRadiusColor,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.5,
                  color: ColorName.borderRadiusColor,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.5,
                  color: ColorName.errorColor,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorName.iconsColor,
                  ),
            ),
            onChanged: widget.press as Function(String),
          ),
        ],
      ),
    );
  }
}
