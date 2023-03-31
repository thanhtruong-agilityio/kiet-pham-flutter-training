import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_widgetbook/core/models/icon.dart';
import 'package:gotour_widgetbook/core/widgets/code_view.dart';
import 'package:widgetbook/widgetbook.dart';

class GTWBBuildButton extends StatelessWidget {
  const GTWBBuildButton({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CodeView(
              title: 'Button Icon',
              code:
                  '''GTButton.icon(\n  icon: icon,\n  iconColor: color,\n  onPress: () {},\n)\n''',
            ),
            const SizedBox(height: 10),
            GTIconButton(
              icon: context.knobs.options(
                label: 'Icon',
                options: icons,
              ),
              iconColor: colorScheme.background,
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            const CodeView(
              title: 'Button Normal',
              code:
                  '''GTButton.normal(\n  icon: icon,\n  text: text,\n  onPress: () {},\n)\n''',
            ),
            const SizedBox(height: 10),
            GTElevatedButton(
              icon: context.knobs.options(label: 'Icon', options: icons),
              text: context.knobs.text(label: 'Text'),
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            const CodeView(
              title: 'Button Highlight',
              code:
                  '''GTButton.highlight(\n  text: text,\n  activateShadow: true\n  onPress: () {},\n)\n''',
            ),
            const SizedBox(height: 10),
            GTElevatedHighlightButton(
              text: context.knobs.text(
                label: 'Text',
                initialValue: 'Sign Up',
              ),
              activateShadow: context.knobs.boolean(
                label: 'activateShadow',
                initialValue: true,
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            const CodeView(
              title: 'Button Text',
              code: '''GTButton.text(\n  text: text,\n  onPress: () {},\n)\n''',
            ),
            const SizedBox(height: 10),
            GTTextButton(
              text: context.knobs.text(
                label: 'Text',
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            const CodeView(
              title: 'Button Text Highlight',
              code: '''GTButton.text(\n  text: text,\n  onPress: () {},\n)\n''',
            ),
            const SizedBox(height: 10),
            GTTextHighlightButton(
              text: context.knobs.text(
                label: 'Text',
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
