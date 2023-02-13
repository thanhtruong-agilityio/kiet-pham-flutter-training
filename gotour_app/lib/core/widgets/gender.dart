import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTGender extends StatefulWidget {
  const GTGender({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  @override
  State<GTGender> createState() => _GTGenderState();
}

class _GTGenderState extends State<GTGender> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final gender = <String>[
      S.of(context).signUpPageGenderMale,
      S.of(context).signUpPageGenderFemale,
    ];
    final size = MediaQuery.of(context).size;
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            gender.length,
            (index) => SizedBox(
              width: size.width * 0.4,
              child: GTCheckbox(
                text: gender[index],
                onTap: widget.onTap,
                child: index == selectedIndex
                    ? GTCheckboxSelected(
                        onPress: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      )
                    : GTCheckboxUnSelected(
                        onPress: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class GTCheckboxUnSelected extends StatelessWidget {
  const GTCheckboxUnSelected({
    super.key,
    required this.onPress,
  });
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 7.5,
            vertical: 7.5,
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
    );
  }
}

class GTCheckboxSelected extends StatelessWidget {
  const GTCheckboxSelected({
    super.key,
    required this.onPress,
  });
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: SvgPicture.asset(
            Assets.icons.checkmark,
          ),
        ),
      ),
    );
  }
}

class GTCheckbox extends StatefulWidget {
  const GTCheckbox({
    super.key,
    required this.text,
    this.selected = true,
    required this.child,
    required this.onTap,
  });

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
