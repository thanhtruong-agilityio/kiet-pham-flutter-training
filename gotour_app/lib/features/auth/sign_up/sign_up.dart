import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/alert_dialog.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/gender.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/textfield.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/auth/validator/validator.dart';

class GTSignUpPage extends StatelessWidget {
  const GTSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Navigating to the dashboard screen if the user is authenticated
          context.go('/main-page');
        }
        if (state is UnVerifyEmail) {
          showDialog<String>(
            context: context,
            builder: (context) => GTAlertDialog(
              onCancel: () {
                Navigator.of(context).pop();
              },
              onOk: () {
                context.go('/login-page');
              },
              title: 'verify email',
              content: 'check your email',
            ),
          );
        }
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: GTText.labelLarge(
                context,
                text: state.error,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        }
      },
      child: const _GTLoginPage(),
    );
  }
}

class _GTLoginPage extends StatelessWidget {
  const _GTLoginPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Loading) {
          // Showing the loading indicator while the user is signing in
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        }
        return const _GTSignUpView();
      },
    );
  }
}

class _GTSignUpView extends StatefulWidget {
  const _GTSignUpView();

  @override
  State<_GTSignUpView> createState() => _GTSignUpViewState();
}

class _GTSignUpViewState extends State<_GTSignUpView> {
  bool agreeTerms = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.width / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Assets.images.logo.provider(),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GTText.displaySmall(
                        context,
                        text: S.of(context).signUpTitle,
                      ),
                      GTTextField(
                        controller: _emailController,
                        hintText: 'email@example.com',
                        title: S.of(context).textFieldEmail,
                        keyboardType: TextInputType.emailAddress,
                        activateLabel: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) {
                          return !AuthValidator.isValidEmail(email!)
                              ? 'Enter a valid email'
                              : null;
                        },
                      ),
                      // const SizedBox(height: 20),
                      GTGender(onTap: () {}),
                      const SizedBox(height: 20),
                      GTTextField(
                        controller: _passwordController,
                        hintText: S.of(context).textFieldPassword,
                        title: S.of(context).textFieldPassword,
                        obscureText: true,
                        activateLabel: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (password) {
                          return !AuthValidator.isValidPassword(password!)
                              ? 'Password must be more than 6 characters'
                              : null;
                        },
                      ),
                      GTTextField(
                        controller: _passwordConfirmController,
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
                              ? 'Confirm password must be same as password'
                              : null;
                        },
                      ),
                      // const SizedBox(height: 20),
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                              SignUpRequested(
                                _emailController.text,
                                _passwordController.text,
                                _passwordConfirmController.text,
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      GTTextHighlightButton(
                        text: 'Already have an account?',
                        onPressed: () => context.go('/login-page'),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
