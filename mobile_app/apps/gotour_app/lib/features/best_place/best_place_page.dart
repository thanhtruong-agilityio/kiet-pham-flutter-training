import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/search.dart';
import 'package:gotour_ui/core/widgets/tag.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTBestPlacePage extends StatelessWidget {
  const GTBestPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);

    return GTScaffold(
      appBar: GTAppBar(
        leading: GTIconButton(
          icon: GTAssets().back,
          btnColor: colorScheme.background,
          onPressed: () => context.pop(),
        ),
        actionButtons: [
          GTIconButton(
            icon: GTAssets().notification,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: device.scale(44)),
          const GTSearch(),
          SizedBox(height: device.scale(20)),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _CardBestPlace(colorScheme: colorScheme);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CardBestPlace extends StatelessWidget {
  const _CardBestPlace({
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: device.scale(5),
        horizontal: device.scale(20),
      ),
      child: SizedBox(
        height: device.scale(132),
        width: device.scale(335),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: device.scale(15)),
                  child: GTImage(
                    images: GTAssets().kyoto,
                    height: device.scale(92),
                    width: device.scale(70),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: device.scale(11),
                    top: device.scale(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GTText.titleSmall(
                                  context,
                                  text: 'Bien Thanh Khe',
                                ),
                                SizedBox(
                                  height: device.scale(10),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      GTAssets().location,
                                      color: colorScheme.primary,
                                      width: device.scale(10),
                                      height: device.scale(12),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: device.scale(9),
                                      ),
                                      child: GTText.labelMedium(
                                        context,
                                        text: 'Da Nang',
                                        color: colorScheme.tertiary,
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: device.scale(19),
                                      ),
                                      child: SizedBox(
                                        height: 25,
                                        child: GTElevatedHighlightButton(
                                          text: r'$2 000',
                                          onPressed: () {},
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: device.scale(13),
                            ),
                            Row(
                              children: List.generate(
                                2,
                                (index) => Container(
                                  margin:
                                      EdgeInsets.only(right: device.scale(12)),
                                  child: const GTTag(text: '3 day'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
