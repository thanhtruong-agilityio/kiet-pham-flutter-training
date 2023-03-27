import 'package:flutter/material.dart';
import 'package:mobile_app/core/resources/assets_generated/assets.gen.dart';
import 'package:mobile_app/core/resources/l10n_generated/l10n.dart';
import 'package:mobile_app/core/widgets/button.dart';

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
                decoration: InputDecoration(
                  hintText: S.of(context).mainPageHintTextSearchButton,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          GTIconButton(
            icon: Assets.icons.search,
            iconColor: Theme.of(context).colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
