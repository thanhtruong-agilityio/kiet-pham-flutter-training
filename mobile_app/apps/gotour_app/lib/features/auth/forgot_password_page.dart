import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/auth/validator/validator.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/indicator.dart';
import 'package:gotour_ui/core/widgets/snack_bar.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_ui/core/widgets/textfield.dart';

class GTForgotPasswordPage extends StatelessWidget {
  const GTForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // if state is Loading then show indicator
        if (state is Loading) {
          gtIndicatorOverlay.show(context, 'loading');
        } else {
          gtIndicatorOverlay.hide(context);
        }
        if (state is ForgotPasswordSubmitedState) {
          // Navigating to the dashboard screen if the user is authenticated
          GTSnackBar.success(
            context,
            message: S.of(context).forgotPasswordMessage,
          );
          context.go('/login-page');
        }
      },
      child: const _GTForgotPasswordView(),
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
    final device = GTReponsive.of(context);
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
                    SizedBox(height: device.sh(50)),
                    Image.asset(
                      GTAssets().logo,
                      width: device.sw(256),
                      height: device.sh(90),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: device.sh(70),
                    ),
                    GTText.displaySmall(
                      context,
                      text: S.of(context).forgotPasswordPageTitle,
                    ),
                    SizedBox(height: device.sh(70)),
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
                    SizedBox(height: device.sh(10)),
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
                    SizedBox(height: device.sh(20)),
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
