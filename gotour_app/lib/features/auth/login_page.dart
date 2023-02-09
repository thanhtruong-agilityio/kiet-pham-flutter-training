import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/resources/assets_generated/assets.gen.dart';
import '../../core/resources/assets_generated/colors.gen.dart';
import '../../core/widgets/button.dart';
import '../../core/widgets/text.dart';
import '../../core/widgets/title-with-textfield.dart';

class GTLoginPage extends StatelessWidget {
  const GTLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          GTText.displaySmall(context, 'Login'),
          const Spacer(
            flex: 2,
          ),
          const GTTextField(
            hintText: 'email@example.com',
            title: 'Email',
          ),
          const Spacer(),
          const GTTextField(
            hintText: 'Password',
            title: 'Password',
            hideText: true,
          ),
          const Spacer(),
          GTButton.textHighlight(
            text: 'Forgot Password?',
            onPress: () {},
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GTButton.highlight(
              text: 'Log In',
              onPress: () => context.go('/home-page'),
            ),
          ),
          const Spacer(),
          GTText.labelLarge(
            context,
            'Or',
            color: ColorName.iconsColor,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GTButton.normal(
              text: 'Log In With Google',
              icon: Assets.icons.google,
              onPress: () {},
            ),
          ),
          const Spacer(),
          GTButton.textHighlight(
            text: 'Sign Up Here',
            onPress: () {},
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
