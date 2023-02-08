import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_generated/assets.gen.dart';
import '../resources/assets_generated/colors.gen.dart';
import 'text.dart';

class GTCheckboxGender extends StatefulWidget {
  const GTCheckboxGender({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  @override
  State<GTCheckboxGender> createState() => _GTCheckboxGenderState();
}

class _GTCheckboxGenderState extends State<GTCheckboxGender> {
  // bool selectedCheckbox = true;
  int selectedIndex = 0;
  List<String> gender = [
    'Male',
    'Female',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            gender.length,
            (index) => SizedBox(
              width: size.width * 0.4,
              child: Expanded(
                child: GTCheckbox(
                  text: gender[index],
                  onTap: widget.onTap as Function(),
                  child: index == selectedIndex
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: SvgPicture.asset(
                                Assets.icons.checkmark,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: ColorName.borderRadiusColor,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class GTCheckbox extends StatefulWidget {
  const GTCheckbox({
    Key? key,
    required this.text,
    this.selected = true,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final bool? selected;
  final Function onTap;
  final Widget child;

  @override
  State<GTCheckbox> createState() => _GTCheckboxState();
}

class _GTCheckboxState extends State<GTCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: ColorName.borderRadiusColor, width: 1.5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GTText.labelMedium(context, widget.text),
          ),
          const Spacer(),
          Container(child: widget.child),
        ],
      ),
    );
  }
}
