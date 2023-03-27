import 'package:flutter/material.dart';
import 'package:gotour_ui/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:mobile_app/core/assets/assets.dart';

class GTService extends StatefulWidget {
  const GTService({super.key});

  @override
  State<GTService> createState() => _GTServiceState();
}

class _GTServiceState extends State<GTService> {
  int selectedIndex = 0;
  List<String> icons = [
    GTAssets().sun,
    GTAssets().air,
    GTAssets().boat,
    GTAssets().car,
    GTAssets().moto,
  ];
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 76,
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GTText.titleMedium(
                  context,
                  text: S.of(context).tourDetailsPageService,
                ),
                const SizedBox(
                  height: 14,
                ),
                Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        icons.length,
                        (index) => GTIconButton(
                          icon: icons[index],
                          iconColor: index == selectedIndex
                              ? colorScheme.background
                              : colorScheme.tertiary,
                          btnColor: index == selectedIndex
                              ? colorScheme.primary
                              : colorScheme.surface,
                          onPressed: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
