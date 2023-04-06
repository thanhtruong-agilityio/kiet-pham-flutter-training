import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTGender extends StatefulWidget {
  const GTGender({
    super.key,
    required this.gender,
  });

  final int gender;

  @override
  State<GTGender> createState() => _GTGenderState();
}

class _GTGenderState extends State<GTGender> {
  late int selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                width: 1.5,
              ),
            ),
            child: ListTile(
              dense: true,
              trailing: SizedBox(
                height: 18,
                width: 18,
                child: GTCheckBox(
                  isChecked: selectedValue == 0,
                  onPressed: (value) {
                    setState(() {
                      selectedValue = (value! ? 0 : null)!;
                    });
                  },
                ),
              ),
              title: GTText.labelMedium(
                context,
                text: S.of(context).signUpPageGenderMale,
              ),
              onTap: () {
                setState(() {
                  selectedValue = 0;
                });
              },
              selected: selectedValue == 0,
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                width: 1.5,
              ),
            ),
            child: ListTile(
              dense: true,
              trailing: SizedBox(
                height: 18,
                width: 18,
                child: GTCheckBox(
                  isChecked: selectedValue == 1,
                  onPressed: (value) {
                    setState(() {
                      selectedValue = (value! ? 1 : null)!;
                    });
                  },
                ),
              ),
              title: GTText.labelMedium(
                context,
                text: S.of(context).signUpPageGenderFemale,
              ),
              onTap: () {
                setState(() {
                  selectedValue = 1;
                });
              },
              selected: selectedValue == 1,
            ),
          ),
        ),
      ],
    );
  }
}

class GTCheckBox extends StatefulWidget {
  const GTCheckBox({
    super.key,
    required this.isChecked,
    this.onPressed,
    this.onTap,
  });

  final bool isChecked;
  final void Function(bool?)? onPressed;
  final VoidCallback? onTap;

  @override
  State<GTCheckBox> createState() => _GTCheckBoxState();
}

class _GTCheckBoxState extends State<GTCheckBox> {
  late bool _isChecked;

  @override
  Widget build(BuildContext context) {
    _isChecked = widget.isChecked;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: widget.onTap,
      onHighlightChanged: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: _isChecked
            ? SvgPicture.asset('packages/gotour_ui/assets/icons/checkmark.svg')
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7.5,
                  vertical: 7.5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: colorScheme.onSurfaceVariant,
                    width: 1.5,
                  ),
                ),
              ),
      ),
    );
  }
}
