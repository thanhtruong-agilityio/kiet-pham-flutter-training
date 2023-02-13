import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/app_bar.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/textfield.dart';
import 'package:gotour_app/features/main/best_place.dart';
import 'package:gotour_app/features/main/my_location.dart';

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GTText.titleLarge(
                  context,
                  S.of(context).mainPageTitle,
                ),
              ),
              const SizedBox(height: 30),
              // Search Box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: GTTextField(
                        hintText: S.of(context).mainPageHintTextSearchButton,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GTButton.icon(
                      icon: Assets.icons.search,
                      iconColor: ColorName.backgroundColor,
                      onPress: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // My Location
              GTMyLocation(
                press: () => GoRouter.of(context).pushNamed('tour-details'),
              ),
              const SizedBox(height: 20),
              // Best Place
              GTBestPlace(
                pressCard: () => GoRouter.of(context).pushNamed('tour-details'),
                pressBtn: () => GoRouter.of(context).pushNamed('hot-place'),
                pressBtnPrice: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
