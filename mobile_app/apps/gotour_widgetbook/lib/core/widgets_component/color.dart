import 'package:flutter/material.dart';
import 'package:gotour_widgetbook/core/models/color.dart';
import 'package:gotour_widgetbook/core/widgets/card_color.dart';

class WBColor extends StatelessWidget {
  const WBColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 6, child: CardColor(data: whiteToBlack)),
        Expanded(flex: 2, child: CardColor(data: primaryColor)),
        Expanded(flex: 2, child: CardColor(data: errorColor)),
      ],
    );
  }
}
