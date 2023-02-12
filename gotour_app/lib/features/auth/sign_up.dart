import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/checkbox_gender.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/title_with_textfield.dart';

class GTSignUpPage extends StatefulWidget {
  const GTSignUpPage({super.key});

  @override
  State<GTSignUpPage> createState() => _GTSignUpPageState();
}

class _GTSignUpPageState extends State<GTSignUpPage> {
  bool agreeTerms = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Container(
            height: size.width / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.logo.provider(),
              ),
            ),
          ),
          const Spacer(),
          GTText.displaySmall(context, S.of(context).signUpTitle),
          const Spacer(
            flex: 5,
          ),
          GTTextField(
            hintText: 'email@example.com',
            title: S.of(context).textFieldEmail,
            activateLabel: true,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GTCheckboxGender(
              onTap: () {},
            ),
          ),
          const Spacer(),
          GTTextField(
            hideText: true,
            hintText: S.of(context).textFieldPassword,
            title: S.of(context).textFieldPassword,
            activateLabel: true,
          ),
          const Spacer(),
          GTTextField(
            hideText: true,
            hintText: S.of(context).textFieldPassword,
            title: S.of(context).signUpPageConfirmPassword,
            activateLabel: true,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                SizedBox(
                  child: agreeTerms == false
                      ? GTCheckboxUnSelected(
                          onPress: () {
                            setState(() {
                              agreeTerms = !agreeTerms;
                            });
                          },
                        )
                      : GTCheckboxSelected(
                          onPress: () {
                            setState(() {
                              agreeTerms = !agreeTerms;
                            });
                          },
                        ),
                ),
                GTText.labelSmall(context, S.of(context).signUpPageTextTerms),
                GTButton.textHighlight(
                  text: S.of(context).signUpPageTextButtonTerms,
                  onPress: () {},
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GTButton.highlight(
              activateShadow: true,
              text: S.of(context).signUpTitle,
              onPress: () => context.go('/main-page'),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
