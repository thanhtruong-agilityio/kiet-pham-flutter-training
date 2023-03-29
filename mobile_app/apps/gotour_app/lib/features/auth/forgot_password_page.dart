import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/auth/validator/validator.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/shared/snack_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_ui/core/widgets/textfield.dart';

class GTForgotPasswordPage extends StatelessWidget {
  const GTForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SubmitForgotPassword) {
          // Navigating to the dashboard screen if the user is authenticated
          GTSnackBar.show(
            context,
            message:
                '''We have sent you a password reset email. Please check your email''',
            backgroundColor: colorScheme.secondaryContainer,
          );
          context.go('/login-page');
        }
        if (state is AuthError) {
          // Showing the error message if the user has entered invalid credentials
          GTSnackBar.show(
            context,
            message: state.error,
            backgroundColor: colorScheme.error,
          );
        }
      },
      child: const _GTForgotPasswordPage(),
    );
  }
}

class _GTForgotPasswordPage extends StatelessWidget {
  const _GTForgotPasswordPage();

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
        return const _GTForgotPasswordView();
      },
    );
  }
}

class _GTForgotPasswordView extends StatefulWidget {
  const _GTForgotPasswordView();

  @override
  State<_GTForgotPasswordView> createState() => __GTForgotPasswordViewState();
}

class __GTForgotPasswordViewState extends State<_GTForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
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
                    // Container(
                    //   height: size.width / 2,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: Image.asset(name),
                    //     ),
                    //   ),
                    // ),
                    Image.asset(
                      GTAssets().logo,
                      height: size.width / 2,
                    ),
                    const SizedBox(height: 20),
                    GTText.displaySmall(
                      context,
                      text: S.of(context).forgotPasswordPageTitle,
                    ),
                    const SizedBox(height: 30),
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
                    const SizedBox(height: 20),
                    GTElevatedHighlightButton(
                      activateShadow: true,
                      text: S.of(context).forgotPasswordPageButtonSubmit,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            ForgotPasswordRequested(_emailController.text),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    GTTextHighlightButton(
                      text:
                          S.of(context).forgotPasswordPageButtonBackToLoginPage,
                      onPressed: () => context.go('/login-page'),
                    ),
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
