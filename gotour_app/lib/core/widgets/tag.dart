import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';

import 'package:gotour_app/core/widgets/text.dart';

class GTTag extends StatelessWidget {
  const GTTag({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      height: 20,
      decoration: BoxDecoration(
        color: ColorName.tagColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: GTText.bodySmall(
        context,
        text,
        color: ColorName.onTag,
      ),
    );
  }
}
