import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_widgetbook/core/models/color.dart';

class CardColor extends StatelessWidget {
  const CardColor({
    required this.data,
    super.key,
  });

  final List<ColorInfo> data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Container(
              height: 40,
              width: size.width,
              color: data[index].color,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Row(
                children: [
                  GTText.bodySmall(
                    context,
                    text: data[index].hex,
                    color: index > 3
                        ? colorScheme.onSecondary
                        : colorScheme.onBackground,
                  ),
                  const Spacer(),
                  GTText.bodySmall(
                    context,
                    text: data[index].name,
                    color: index > 3
                        ? colorScheme.onSecondary
                        : colorScheme.onBackground,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
