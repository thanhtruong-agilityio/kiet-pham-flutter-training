import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_app/features/hot_place/hot_place.dart';
import 'package:gotour_app/features/hot_place/place_info.dart';
import 'package:gotour_ui/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';

class GTHotPlace extends StatelessWidget {
  const GTHotPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GTScaffold(
      appBar: GTAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GTIconButton(
            icon: GTAssets().back,
            btnColor: colorScheme.background,
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
        actionButtons: [
          GTIconButton(
            icon: GTAssets().notification,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
          GTIconButton(
            icon: GTAssets().more,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 44),
            GTPlaceInfoHotPlace(
              image: Assets.images.tibidabo.path,
              placeName: 'Capital of Thailand',
              location: 'Bangkok, Thailand',
              price: '5 000',
              pressCard: () {},
              pressBtn: () {},
            ),
            const SizedBox(height: 25),
            const Expanded(child: GTGridViewHotPlace()),
          ],
        ),
      ),
    );
  }
}
