import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/app-bar.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/card-best-place.dart';
import 'package:gotour_app/core/widgets/card-my-location.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/title-with-textfield.dart';

class GTMainPage extends StatelessWidget {
  const GTMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                'Get Ready For \n The Travel Trip!',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 60,
                child: Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: GTTextField(hintText: 'Find your location...'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: GTButton.icon(
                          icon: Assets.icons.search,
                          iconColor: ColorName.backgroundColor,
                          onPress: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27),
              child: GTMyLocation(
                press: () => context.go('/tour-details'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27),
              child: GTBestPlace(
                pressCard: () => context.go('/tour-details'),
                pressBtn: () => context.go('/hot-place'),
                pressBtnPrice: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
