import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/auth/validator/validator.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/indicator.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
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
        if (state is ForgotPasswordLoadingState) {
          gtIndicatorOverlay.show(context, S.of(context).loading);
        } else {
          gtIndicatorOverlay.hide(context);
        }
        // if state is ForgotPasswordSubmitedState then show snackbar
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
    return GTScaffold(
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
                    // logo image
                    GTLocalImage(
                      image: GTAssets.imgLogo,
                      width: device.sw(256),
                      height: device.sh(90),
                    ),
                    SizedBox(
                      height: device.sh(70),
                    ),
                    // Title
                    GTText.displaySmall(
                      context,
                      text: S.of(context).forgotPasswordPageTitle,
                    ),
                    SizedBox(height: device.sh(70)),
                    // Email TextField
                    GTTextField(
                      controller: _emailController,
                      hintText: S.of(context).emailExample,
                      title: S.of(context).textFieldEmail,
                      activateLabel: true,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {
                        context
                            .read<AuthBloc>()
                            .add(ValueChangedEvent(value: value));
                      },
                      validator: (email) {
                        return !AuthValidator.isValidEmail(email ?? '')
                            ? S.of(context).errorInValidEmail
                            : null;
                      },
                    ),
                    SizedBox(height: device.sh(10)),
                    // Button submit
                    BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) =>
                          current is ValueChangedSuccessState,
                      builder: (context, state) {
                        final formValid =
                            AuthValidator.formForgotPaasswordValid(
                          email: _emailController.text,
                        );

                        return GTElevatedHighlightButton(
                          activateShadow: true,
                          isEnabled: formValid,
                          text: S.of(context).forgotPasswordPageButtonSubmit,
                          onPressed: formValid
                              ? () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    BlocProvider.of<AuthBloc>(context).add(
                                      ForgotPasswordRequestedEvent(
                                        _emailController.text,
                                      ),
                                    );
                                  }
                                }
                              : () {},
                        );
                      },
                    ),
                    SizedBox(height: device.sh(20)),
                    // Button Back to login
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
