import 'package:flutter/material.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTService extends StatefulWidget {
  const GTService({super.key});

  @override
  State<GTService> createState() => _GTServiceState();
}

class _GTServiceState extends State<GTService> {
  int selectedIndex = 0;
  List<String> icons = [
    GTAssets.icSun,
    GTAssets.icAir,
    GTAssets.icBoat,
    GTAssets.icCar,
    GTAssets.icMoto,
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: device.scale(20)),
      height: device.scale(86),
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
                SizedBox(
                  height: device.scale(14),
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
