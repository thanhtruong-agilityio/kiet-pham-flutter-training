import 'package:flutter/material.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/button.dart';

class GTSearch extends StatelessWidget {
  const GTSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                style: Theme.of(context).textTheme.labelMedium,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  hintText: S.of(context).mainPageHintTextSearchButton,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          GTIconButton(
            icon: GTAssets.icSearch,
            iconColor: Theme.of(context).colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
