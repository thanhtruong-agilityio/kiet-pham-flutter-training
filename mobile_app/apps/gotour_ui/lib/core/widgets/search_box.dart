import 'package:flutter/material.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/button.dart';

class GTSearchBox extends StatelessWidget {
  const GTSearchBox({
    super.key,
    this.onPressed,
    this.value,
    this.controller,
    this.onClear,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onClear;
  final void Function(String)? value;
  final TextEditingController? controller;

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
                controller: controller,
                style: Theme.of(context).textTheme.labelMedium,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  hintText: S.of(context).mainPageHintTextSearchButton,
                  suffixIcon: GestureDetector(
                    onTap: onClear ?? () {},
                    child: const Icon(
                      Icons.clear_outlined,
                      size: 16,
                    ),
                  ),
                ),
                onChanged: value,
              ),
            ),
          ),
          const SizedBox(width: 20),
          GTIconButton(
            icon: GTAssets.icSearch,
            iconColor: Theme.of(context).colorScheme.background,
            onPressed: onPressed ?? () {},
          ),
        ],
      ),
    );
  }
}
