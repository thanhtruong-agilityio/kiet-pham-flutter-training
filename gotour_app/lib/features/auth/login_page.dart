import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/textfield.dart';

class GTLoginPage extends StatelessWidget {
  const GTLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 4,
          ),
          Container(
            height: size.width / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.logo.provider(),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          GTText.displaySmall(context, S.of(context).loginTitle),
          const Spacer(
            flex: 2,
          ),
          GTTextField(
            hintText: 'email@example.com',
            title: S.of(context).textFieldEmail,
            activateLabel: true,
          ),
          const Spacer(),
          GTTextField(
            hintText: S.of(context).textFieldPassword,
            title: S.of(context).textFieldPassword,
            hideText: true,
            activateLabel: true,
          ),
          const Spacer(),
          GTButton.textHighlight(
            text: S.of(context).loginPageButtonForgotPassword,
            onPress: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GTButton.highlight(
              activateShadow: true,
              text: S.of(context).loginPageTitle,
              onPress: () => context.go('/main-page'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: GTText.labelLarge(
              context,
              'Or',
              color: ColorName.iconsColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GTButton.normal(
              text: S.of(context).loginPageButtonLoginGG,
              icon: Assets.icons.google,
              onPress: () {},
            ),
          ),
          const Spacer(),
          GTButton.textHighlight(
            text: S.of(context).loginPageButtonSignUpHere,
            onPress: () => context.go('/sign-up-page'),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
