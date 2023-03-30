import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/auth/validator/validator.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/shared/snack_bar.dart';
import 'package:gotour_ui/core/widgets/alert_dialog.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_ui/core/widgets/textfield.dart';

class GTLoginPage extends StatelessWidget {
  const GTLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Navigating to the dashboard screen if the user is authenticated
          context.go('/home-page');
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
              title: S.of(context).verifyEmailMessage,
              content: S.of(context).checkyourEmailMessage,
            ),
          );
        }
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          GTSnackBar.show(
            context,
            message: state.error,
            backgroundColor: Theme.of(context).colorScheme.error,
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
    final device = GTReponsive.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: device.sw(20)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: device.sh(100)),
                    Image.asset(
                      GTAssets().logo,
                      width: device.sw(256),
                      height: device.sh(90),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: device.sh(72)),
                    GTText.displaySmall(
                      context,
                      text: S.of(context).loginTitle,
                    ),
                    SizedBox(height: device.sh(20)),
                    GTTextField(
                      controller: _emailController,
                      hintText: 'email@example.com',
                      title: S.of(context).textFieldEmail,
                      activateLabel: true,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) {
                        return !AuthValidator.isValidEmail(email!)
                            ? S.of(context).errorInValidEmail
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
                            ? S.of(context).errorInValidPassword
                            : null;
                      },
                    ),
                    GTTextHighlightButton(
                      text: S.of(context).loginPageButtonForgotPassword,
                      onPressed: () => context.go('/forgot-password-page'),
                    ),
                    SizedBox(height: device.sh(10)),
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
                    SizedBox(height: device.sh(10)),
                    GTText.labelLarge(
                      context,
                      text: 'Or',
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    SizedBox(height: device.sh(10)),
                    GTElevatedButton(
                      text: S.of(context).loginPageButtonLoginGG,
                      icon: GTAssets().google,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          GoogleSignInRequested(),
                        );
                      },
                    ),
                    SizedBox(height: device.sh(10)),
                    GTTextHighlightButton(
                      text: S.of(context).loginPageButtonSignUpHere,
                      onPressed: () => context.go('/sign-up-page'),
                    ),
                    SizedBox(height: device.sh(20)),
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
