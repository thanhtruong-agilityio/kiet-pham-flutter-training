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
import 'package:gotour_ui/core/widgets/indicator.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/snack_bar.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_ui/core/widgets/textfield.dart';

class GTLoginPage extends StatelessWidget {
  const GTLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // if state is Loading then show indicator
        if (state is LoginLoadingState || state is GoogleSignInRequestedEvent) {
          gtIndicatorOverlay.show(context, 'loading...');
        } else {
          gtIndicatorOverlay.hide(context);
        }
        if (state is AuthenticatedState) {
          // Navigating to the home screen if the user is authenticated
          context.go('/');
        }
        // if state is UnVerifyEmailState, then show snackbar
        if (state is UnVerifyEmailState) {
          showDialog<String>(
            context: context,
            builder: (context) => GTAlertDialog(
              onCancel: () {
                context.pop();
              },
              onOk: () {
                context.pop();
              },
              title: S.of(context).verifyEmailMessage,
              content: S.of(context).checkyourEmailMessage,
            ),
          );
        }
        // Showing the error message if the user has entered invalid credentials
        if (state is AuthErrorState) {
          GTSnackBar.failure(
            context,
            message: state.error,
            backgroundColor: Theme.of(context).colorScheme.error,
          );
        }
      },
      child: const _GTLoginView(),
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
    return GTScaffold(
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
                    // logo image
                    Image.asset(
                      GTAssets().imgLogo,
                      width: device.sw(256),
                      height: device.sh(90),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: device.sh(72)),
                    // Title
                    GTText.displaySmall(
                      context,
                      text: S.of(context).loginTitle,
                    ),
                    SizedBox(height: device.sh(20)),
                    // Email Textfield
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
                    // Password Textfield
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
                    // Forgot Password Button
                    GTTextHighlightButton(
                      text: S.of(context).loginPageButtonForgotPassword,
                      onPressed: () => context.push('/forgot-password-page'),
                    ),
                    SizedBox(height: device.sh(10)),
                    // Login Button
                    GTElevatedHighlightButton(
                      activateShadow: true,
                      text: S.of(context).loginPageTitle,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignInRequestedEvent(
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
                    // Login with google button
                    GTElevatedButton(
                      text: S.of(context).loginPageButtonLoginGG,
                      icon: GTAssets().icGoogle,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          GoogleSignInRequestedEvent(),
                        );
                      },
                    ),
                    SizedBox(height: device.sh(10)),
                    // go to Sign Up button
                    GTTextHighlightButton(
                      text: S.of(context).loginPageButtonSignUpHere,
                      onPressed: () => context.push('/sign-up-page'),
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
