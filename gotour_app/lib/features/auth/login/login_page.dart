import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/alert_dialog.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/textfield.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/auth/validator/validator.dart';

class GTLoginPage extends StatelessWidget {
  const GTLoginPage({super.key});

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
                Navigator.of(context).pop();
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
        return const _GTLoginView();
      },
    );
  }
}

class _GTLoginView extends StatefulWidget {
  const _GTLoginView();

  @override
  State<_GTLoginView> createState() => _GTLoginViewState();
}

class _GTLoginViewState extends State<_GTLoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // const SizedBox(height: 120),
                    Container(
                      height: size.width / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Assets.images.logo.provider(),
                        ),
                      ),
                    ),
                    GTText.displaySmall(
                      context,
                      text: S.of(context).loginTitle,
                    ),
                    const SizedBox(height: 20),
                    GTTextField(
                      controller: _emailController,
                      hintText: 'email@example.com',
                      title: S.of(context).textFieldEmail,
                      activateLabel: true,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) {
                        return !AuthValidator.isValidEmail(email!)
                            ? 'Enter a valid email'
                            : null;
                      },
                    ),
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
                    GTTextHighlightButton(
                      text: S.of(context).loginPageButtonForgotPassword,
                      onPressed: () => context.go('/forgot-password-page'),
                    ),
                    const SizedBox(height: 10),
                    GTElevatedHighlightButton(
                      activateShadow: true,
                      text: S.of(context).loginPageTitle,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignInRequested(
                              _emailController.text,
                              _passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    GTText.labelLarge(
                      context,
                      text: 'Or',
                      color: ColorName.iconsColor,
                    ),
                    const SizedBox(height: 10),
                    GTElevatedButton(
                      text: S.of(context).loginPageButtonLoginGG,
                      icon: Assets.icons.google,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          GoogleSignInRequested(),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    GTTextHighlightButton(
                      text: S.of(context).loginPageButtonSignUpHere,
                      onPressed: () => context.go('/sign-up-page'),
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
