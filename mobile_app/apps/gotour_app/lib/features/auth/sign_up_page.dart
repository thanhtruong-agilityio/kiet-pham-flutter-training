import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/auth/validator/validator.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/alert_dialog.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/gender.dart';
import 'package:gotour_ui/core/widgets/indicator.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_ui/core/widgets/textfield.dart';

class GTSignUpPage extends StatelessWidget {
  const GTSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // if state is Loading then show indicator
        if (state is Loading) {
          gtIndicatorOverlay.show(context, 'loading...');
        }
        if (state is SignUpSubmitedState) {
          showDialog<String>(
            context: context,
            builder: (context) => GTAlertDialog(
              onCancel: () {
                context.pop();
              },
              onOk: () {
                context.go('/login-page');
              },
              title: S.of(context).verifyEmailMessage,
              content: S.of(context).checkyourEmailMessage,
            ),
          );
        }
      },
      child: const _GTSignUpView(),
    );
  }
}

class _GTSignUpView extends StatefulWidget {
  const _GTSignUpView();

  @override
  State<_GTSignUpView> createState() => _GTSignUpViewState();
}

class _GTSignUpViewState extends State<_GTSignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool agreeTerms = false;
  int gender = 0;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: device.sw(20)),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: device.sh(30)),
                    Image.asset(
                      GTAssets().imgLogo,
                      width: device.sw(256),
                      height: device.sh(90),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: device.sh(30)),
                    GTText.displaySmall(
                      context,
                      text: S.of(context).signUpTitle,
                    ),
                    SizedBox(height: device.sh(70)),
                    GTTextField(
                      controller: _emailController,
                      hintText: 'email@example.com',
                      title: S.of(context).textFieldEmail,
                      keyboardType: TextInputType.emailAddress,
                      activateLabel: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) {
                        return !AuthValidator.isValidEmail(email!)
                            ? S.of(context).errorInValidEmail
                            : null;
                      },
                    ),
                    SizedBox(height: device.sh(5)),
                    GTGender(
                      gender: gender,
                    ),
                    SizedBox(height: device.sh(20)),
                    GTTextField(
                      controller: _passwordController,
                      hintText: S.of(context).textFieldPassword,
                      title: S.of(context).textFieldPassword,
                      obscureText: true,
                      activateLabel: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) {
                        return !AuthValidator.isValidPassword(password!)
                            ? S.of(context).errorInValidPassword
                            : null;
                      },
                    ),
                    GTTextField(
                      controller: _confirmPasswordController,
                      hintText: S.of(context).signUpPageConfirmPassword,
                      title: S.of(context).signUpPageConfirmPassword,
                      obscureText: true,
                      activateLabel: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (passwordConfirm) {
                        return !AuthValidator.isValidPasswordConfirm(
                          _passwordController.text,
                          passwordConfirm!,
                        )
                            ? S.of(context).errorInvalidPasswordConfirm
                            : null;
                      },
                    ),
                    // const SizedBox(height: 20),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GTCheckBox(
                            isChecked: agreeTerms,
                            onTap: () {
                              setState(() {
                                agreeTerms = !agreeTerms;
                              });
                            },
                          ),
                        ),
                        GTText.labelMedium(
                          context,
                          text: S.of(context).signUpPageTextTerms,
                        ),
                        GTTextHighlightButton(
                          text: S.of(context).signUpPageTextButtonTerms,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GTElevatedHighlightButton(
                      text: S.of(context).signUpTitle,
                      activateShadow: true,
                      backgroudColor: agreeTerms
                          ? colorScheme.primary
                          : colorScheme.secondary,
                      onPressed: agreeTerms
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(
                                  SignUpRequested(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    confirmPassword:
                                        _confirmPasswordController.text,
                                    gender: gender,
                                  ),
                                );
                              }
                            }
                          : () {},
                    ),
                    const SizedBox(height: 10),
                    GTTextHighlightButton(
                      text: S.of(context).sugnUpPageAllreadyHaveAnAccount,
                      onPressed: () => context.pop(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
