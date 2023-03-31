import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/textfield.dart';
import 'package:widgetbook/widgetbook.dart';

class GTWBBuildTextField extends StatelessWidget {
  const GTWBBuildTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GTTextField(
      title: context.knobs.text(
        label: 'title',
      ),
      hintText: context.knobs.text(
        label: 'hintText',
        initialValue: 'input value',
      ),
      activateLabel: context.knobs.boolean(
        label: 'activateLabel',
      ),
      obscureText: context.knobs.boolean(
        label: 'obscureText',
      ),
    );
  }
}
