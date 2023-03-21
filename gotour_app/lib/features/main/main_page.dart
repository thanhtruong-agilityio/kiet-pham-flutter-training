import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/alert_dialog.dart';
import 'package:gotour_app/core/widgets/app_bar.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/textfield.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/main/best_place.dart';
import 'package:gotour_app/features/main/my_location.dart';

class GTMainPage extends StatelessWidget {
  const GTMainPage({super.key});

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
      child: const _GTMainView(),
    );
  }
}

class _GTMainView extends StatelessWidget {
  const _GTMainView();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GTScaffold(
      appBar: GTAppBar(
        leading: GTIconButton(
          icon: Assets.icons.menu,
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
                    image: AssetImage(Assets.images.author.path),
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
                        icon: Assets.icons.search,
                        iconColor: colorScheme.background,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // My Location
              GTMyLocation(
                press: () => GoRouter.of(context).pushNamed('tour-details'),
              ),
              const SizedBox(height: 20),
              // Best Place
              // Text(data.length.toString()),
              GTBestPlace(
                pressCard: () => GoRouter.of(context).pushNamed('tour-details'),
                pressBtn: () => GoRouter.of(context).pushNamed('hot-place'),
                pressBtnPrice: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
