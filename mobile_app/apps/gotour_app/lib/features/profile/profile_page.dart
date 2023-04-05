import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/profile/banking_and_payment_card.dart';
import 'package:gotour_app/features/profile/preference_card.dart';
import 'package:gotour_app/features/profile/profile_card.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/alert_dialog.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTProfilePage extends StatelessWidget {
  const GTProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticatedState) {
          context.go('/login-page');
        }
      },
      child: GTScaffold(
        appBar: GTAppBar(
          title: GTText.titleLarge(context, text: 'Profile'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: device.scale(45)),
                const ProfileCard(
                  userName: 'Kiet Anh',
                  email: 'kietpva010299@gmail.com',
                ),
                SizedBox(height: device.scale(30)),
                const PreferenceCard(),
                SizedBox(height: device.scale(30)),
                const BankingAndPaymentCard(),
                SizedBox(height: device.scale(10)),
                GTElevatedHighlightButton(
                  text: S.of(context).LogOut,
                  activateShadow: true,
                  onPressed: () {
                    showDialog<Function>(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => GTAlertDialog(
                        onCancel: () {
                          Navigator.of(context).pop();
                        },
                        onOk: () {
                          context.read<AuthBloc>().add(SignOutRequestedEvent());
                        },
                        title: S.of(context).LogOut,
                        content: S.of(context).logOutMessage,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
