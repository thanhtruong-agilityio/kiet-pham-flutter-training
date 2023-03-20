import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTGender extends StatefulWidget {
  const GTGender({super.key});

  @override
  State<GTGender> createState() => _GTGenderState();
}

class _GTGenderState extends State<GTGender> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border:
                  Border.all(color: ColorName.borderRadiusColor, width: 1.5),
            ),
            child: ListTile(
              dense: true,
              trailing: SizedBox(
                height: 18,
                width: 18,
                child: GTCheckBox(
                  isChecked: _selectedValue == 0,
                  onPressed: (value) {
                    setState(() {
                      _selectedValue = (value ? 0 : null)!;
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
                  _selectedValue = 0;
                });
              },
              selected: _selectedValue == 0,
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border:
                  Border.all(color: ColorName.borderRadiusColor, width: 1.5),
            ),
            child: ListTile(
              dense: true,
              trailing: SizedBox(
                height: 18,
                width: 18,
                child: GTCheckBox(
                  isChecked: _selectedValue == 1,
                  onPressed: (value) {
                    setState(() {
                      _selectedValue = (value ? 1 : null)!;
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
                  _selectedValue = 1;
                });
              },
              selected: _selectedValue == 1,
            ),
          ),
        ),
      ],
    );
  }
}

// class GTGender extends StatefulWidget {
//   const GTGender({
//     super.key,
//     required this.male,
//     required this.female,
//   });

//   final bool male;
//   final bool female;

//   @override
//   State<GTGender> createState() => _GTGenderState();
// }

// class _GTGenderState extends State<GTGender> {
//   bool _male = true;
//   bool _female = false;

//   void _toggleMale() {
//     setState(() {
//       _male = true;
//       _female = false;
//     });
//   }

//   void _toggleFemale() {
//     setState(() {
//       _male = false;
//       _female = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: DecoratedBox(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(7),
//               border:
//                   Border.all(color: ColorName.borderRadiusColor, width: 1.5),
//             ),
//             child: Row(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
//                   child: GTText.labelMedium(
//                     context,
//                     text: S.of(context).signUpPageGenderMale,
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 15),
//                   child: GTCheckBox(
//                     isChecked: _male,
//                     onPressed: _toggleMale,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(width: 40),
//         Expanded(
//           child: DecoratedBox(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(7),
//               border:
//                   Border.all(color: ColorName.borderRadiusColor, width: 1.5),
//             ),
//             child: Row(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
//                   child: GTText.labelMedium(
//                     context,
//                     text: S.of(context).signUpPageGenderFemale,
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 15),
//                   child: GTCheckBox(
//                     isChecked: _female,
//                     onPressed: _toggleFemale,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class GTCheckBox extends StatefulWidget {
  const GTCheckBox({
    super.key,
    required this.isChecked,
    required this.onPressed,
  });

  final bool isChecked;
  final void Function(bool)? onPressed;

  @override
  State<GTCheckBox> createState() => _GTCheckBoxState();
}

class _GTCheckBoxState extends State<GTCheckBox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    _isChecked = widget.isChecked;
    return InkWell(
      // onTap: widget.onPressed,
      onHighlightChanged: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: _isChecked
            ? SvgPicture.asset(Assets.icons.checkmark)
            : Container(
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
