import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
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
          GTText.displaySmall(context, 'Sign Up'),
          const Spacer(
            flex: 5,
          ),
          const GTTextField(
            hintText: 'email@example.com',
            title: 'Email',
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
          const GTTextField(
            hideText: true,
            hintText: 'Password',
            title: 'Password',
            activateLabel: true,
          ),
          const Spacer(),
          const GTTextField(
            hideText: true,
            hintText: 'Password',
            title: 'Confirm Password',
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
                GTText.labelSmall(context, 'I agree and accept the '),
                GTButton.textHighlight(text: 'terms ot use.', onPress: () {}),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GTButton.highlight(
              activateShadow: true,
              text: 'Sign Up',
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
