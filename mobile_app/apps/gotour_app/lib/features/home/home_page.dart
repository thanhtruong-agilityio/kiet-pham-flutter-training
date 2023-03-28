import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/alert_dialog.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_ui/core/widgets/textfield.dart';
import 'package:mobile_app/core/assets/assets.dart';
import 'package:mobile_app/features/auth/bloc/auth_bloc.dart';
import 'package:mobile_app/features/home/best_place.dart';
import 'package:mobile_app/features/home/my_location.dart';

class GTHomePage extends StatelessWidget {
  const GTHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          context.go('/login-page');
        }
        if (state is UnVerifyEmail) {
          context.go('/login-page');
        }
      },
      child: const _GTHomeView(),
    );
  }
}

class _GTHomeView extends StatelessWidget {
  const _GTHomeView();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GTScaffold(
      appBar: GTAppBar(
        leading: GTIconButton(
          icon: GTAssets().menu,
          btnColor: colorScheme.background,
          onPressed: () {},
        ),
        actionButtons: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                showDialog<Function>(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => GTAlertDialog(
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    onOk: () {
                      context.read<AuthBloc>().add(SignOutRequested());
                    },
                    title: 'Log Out',
                    content: 'Do you want to log out',
                  ),
                );
              },
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(GTAssets().author),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GTText.titleLarge(
                  context,
                  text: S.of(context).mainPageTitle,
                ),
              ),
              const SizedBox(height: 30),
              // Search Box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GTTextField(
                        hintText: S.of(context).mainPageHintTextSearchButton,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: GTIconButton(
                        icon: GTAssets().search,
                        iconColor: colorScheme.background,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // My Location
              const GTMyLocation(),
              const SizedBox(height: 20),
              // Best Place
              // Text(data.length.toString()),
              const GTBestPlace(),
            ],
          ),
        ),
      ),
    );
  }
}
