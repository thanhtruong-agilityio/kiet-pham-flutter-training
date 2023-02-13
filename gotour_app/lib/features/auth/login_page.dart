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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 120),
              Container(
                height: size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Assets.images.logo.provider(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GTText.displaySmall(context, S.of(context).loginTitle),
              const SizedBox(height: 30),
              GTTextField(
                hintText: 'email@example.com',
                title: S.of(context).textFieldEmail,
                activateLabel: true,
              ),
              const SizedBox(height: 20),
              GTTextField(
                hintText: S.of(context).textFieldPassword,
                title: S.of(context).textFieldPassword,
                hideText: true,
                activateLabel: true,
              ),
              const SizedBox(height: 28),
              GTButton.textHighlight(
                text: S.of(context).loginPageButtonForgotPassword,
                onPress: () {},
              ),
              const SizedBox(height: 10),
              GTButton.highlight(
                activateShadow: true,
                text: S.of(context).loginPageTitle,
                onPress: () => context.go('/main-page'),
              ),
              const SizedBox(height: 10),
              GTText.labelLarge(
                context,
                'Or',
                color: ColorName.iconsColor,
              ),
              const SizedBox(height: 10),
              GTButton.normal(
                text: S.of(context).loginPageButtonLoginGG,
                icon: Assets.icons.google,
                onPress: () {},
              ),
              const SizedBox(height: 10),
              GTButton.textHighlight(
                text: S.of(context).loginPageButtonSignUpHere,
                onPress: () => context.go('/sign-up-page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
