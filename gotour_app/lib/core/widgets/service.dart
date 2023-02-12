import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';

import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTService extends StatefulWidget {
  const GTService({super.key});

  @override
  State<GTService> createState() => _GTServiceState();
}

class _GTServiceState extends State<GTService> {
  int selectedIndex = 0;
  List<String> icons = [
    Assets.icons.sun,
    Assets.icons.air,
    Assets.icons.boat,
    Assets.icons.car,
    Assets.icons.moto,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  S.of(context).tourDetailsPageService,
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
                        (index) => GTButton.icon(
                          icon: icons[index],
                          iconColor: index == selectedIndex
                              ? ColorName.backgroundColor
                              : ColorName.iconsColor,
                          btnColor: index == selectedIndex
                              ? ColorName.primaryColor
                              : ColorName.surfaceColor,
                          onPress: () {
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
