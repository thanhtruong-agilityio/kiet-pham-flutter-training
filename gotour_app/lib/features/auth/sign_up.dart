import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/gender.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/textfield.dart';

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: size.width / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Assets.images.logo.provider(),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 20),
                  GTText.displaySmall(
                    context,
                    text: S.of(context).signUpTitle,
                  ),
                  const SizedBox(height: 20),
                  GTTextField(
                    hintText: 'email@example.com',
                    title: S.of(context).textFieldEmail,
                    activateLabel: true,
                  ),
                  const SizedBox(height: 20),
                  GTGender(onTap: () {}),
                  const SizedBox(height: 20),
                  GTTextField(
                    hintText: S.of(context).textFieldPassword,
                    title: S.of(context).textFieldPassword,
                    obscureText: true,
                    activateLabel: true,
                  ),
                  const SizedBox(height: 20),
                  GTTextField(
                    hintText: S.of(context).signUpPageConfirmPassword,
                    title: S.of(context).signUpPageConfirmPassword,
                    obscureText: true,
                    activateLabel: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                      GTText.labelSmall(
                        context,
                        text: S.of(context).signUpPageTextTerms,
                      ),
                      GTButton.textHighlight(
                        text: S.of(context).signUpPageTextButtonTerms,
                        onPress: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GTButton.highlight(
                    text: S.of(context).signUpTitle,
                    activateShadow: true,
                    onPress: () => context.go('/main-page'),
                  ),
                  // const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
