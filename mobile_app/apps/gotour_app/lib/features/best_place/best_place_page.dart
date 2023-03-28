import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_ui/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/search.dart';
import 'package:gotour_ui/core/widgets/tag.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:mobile_app/core/assets/assets.dart';

class GTBestPlacePage extends StatelessWidget {
  const GTBestPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
          const SizedBox(height: 44),
          const GTSearch(),
          const SizedBox(height: 20),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: SizedBox(
        height: 132,
        width: 335,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: GTImage(
                    images: GTAssets().kyoto,
                    height: 92,
                    width: 70,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11, top: 20),
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      GTAssets().location,
                                      color: colorScheme.primary,
                                      width: 10,
                                      height: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 9),
                                      child: GTText.labelMedium(
                                        context,
                                        text: 'Da Nang',
                                        color: colorScheme.tertiary,
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 19),
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
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              children: List.generate(
                                2,
                                (index) => Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  child: GTTag(text: '3 day'),
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
