import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotour_ui/core/assets.dart';

class GTMyCheckbox extends StatefulWidget {
  const GTMyCheckbox({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  final bool initialValue;
  final ValueChanged<bool> onChanged;

  @override
  State<GTMyCheckbox> createState() => _GTMyCheckboxState();
}

class _GTMyCheckboxState extends State<GTMyCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChanged(_isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: _isChecked
            ? SvgPicture.asset(GTAssets.icCheck)
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7.5,
                  vertical: 7.5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    width: 1.5,
                  ),
                ),
              ),
      ),
    );
  }
}
