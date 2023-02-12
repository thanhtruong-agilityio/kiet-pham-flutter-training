import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/app_bar.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/card_best_place.dart';
import 'package:gotour_app/core/widgets/card_my_location.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/title_with_textfield.dart';

class GTMainPage extends StatelessWidget {
  const GTMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GTScaffold(
      appBar: GTAppBar.inMain(
        avatar: Assets.images.author.path,
        onPressLeading: () {},
        onPressAvatar: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 47),
              child: GTText.titleLarge(
                context,
                'Get Ready For\nThe Travel Trip!',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: GTTextField(hintText: 'Find your location...'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: GTButton.icon(
                      icon: Assets.icons.search,
                      iconColor: ColorName.backgroundColor,
                      onPress: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27),
              child: GTMyLocation(
                press: () => GoRouter.of(context).pushNamed('tour-details'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27),
              child: GTBestPlace(
                pressCard: () => GoRouter.of(context).pushNamed('tour-details'),
                pressBtn: () => GoRouter.of(context).pushNamed('hot-place'),
                pressBtnPrice: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
