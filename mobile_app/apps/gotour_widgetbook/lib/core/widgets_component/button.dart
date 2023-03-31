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
              title: 'Icon Button',
              code: '''GTIconButton(\n icon: icon,\n onPressed: () {},\n)''',
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
              title: 'Normal Button',
              code:
                  '''GTElevatedButton(\n  text: text,\n  icon: icon,\n  onPressed: () {},\n)''',
            ),
            const SizedBox(height: 10),
            GTElevatedButton(
              icon: context.knobs.options(label: 'Icon', options: icons),
              text: context.knobs.text(label: 'Text'),
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            const CodeView(
              title: 'Highlight Button',
              code:
                  '''GTElevatedHighlightButton(\n  text: text,\n  onPressed: (){},\n)''',
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
              title: 'Text Button',
              code: '''GTTextButton(\n  text: text,\n  onPressed: () {},\n)''',
            ),
            const SizedBox(height: 10),
            GTTextButton(
              text: context.knobs
                  .text(label: 'Text', initialValue: 'text button'),
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            const CodeView(
              title: 'Button Text Highlight',
              code:
                  '''GTTextHighlightButton(\n  text: text,\n  onPressed: () {},\n)''',
            ),
            const SizedBox(height: 10),
            GTTextHighlightButton(
              text: context.knobs
                  .text(label: 'Text', initialValue: 'text hightlight button'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
