import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_widgetbook/core/widgets/code_view.dart';
import 'package:widgetbook/widgetbook.dart';

class GTWBBuildText extends StatelessWidget {
  const GTWBBuildText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GTText.bodyLarge(context, text: 'GTText.bodySmall()'),
            const CodeView(
              title: 'BodyLarge',
              code: '''GTText.bodySmall(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.bodySmall(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'bodyMedium',
              code: '''GTText.bodyMedium(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.bodyMedium(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'bodyLarge',
              code: '''GTText.bodyLarge(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.bodyLarge(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'labelSmall',
              code: '''GTText.labelSmall(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.labelSmall(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'labelMedium',
              code:
                  '''GTText.labelMedium(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.labelMedium(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'labelMedium',
              code:
                  '''GTText.labelMedium(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.labelLarge(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'titleSmall',
              code: '''GTText.titleSmall(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.titleSmall(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'titleMedium',
              code:
                  '''GTText.titleMedium(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.titleMedium(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'titleLarge',
              code: '''GTText.titleLarge(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.titleLarge(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'displaySmall',
              code:
                  '''GTText.displaySmall(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.displaySmall(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            const CodeView(
              title: 'displayMedium',
              code:
                  '''GTText.displayMedium(\n  context,\n  text:\n  'text'\n),''',
            ),
            GTText.displayMedium(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
