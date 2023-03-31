import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/text.dart';
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
            GTText.bodyLarge(context, text: 'GTText.bodySmall()'),
            GTText.bodySmall(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.bodyMedium()'),
            GTText.bodyMedium(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.bodyLarge()'),
            GTText.bodyLarge(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.labelSmall()'),
            GTText.labelSmall(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.labelMedium()'),
            GTText.labelMedium(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.labelLarge()'),
            GTText.labelLarge(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.titleSmall()'),
            GTText.titleSmall(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.titleMedium()'),
            GTText.titleMedium(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.titleLarge()'),
            GTText.titleLarge(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.displaySmall()'),
            GTText.displaySmall(
              context,
              text: context.knobs.text(
                label: 'label',
                initialValue: 'input label',
              ),
            ),
            const SizedBox(height: 30),
            GTText.bodyLarge(context, text: 'GTText.displayMedium()'),
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
