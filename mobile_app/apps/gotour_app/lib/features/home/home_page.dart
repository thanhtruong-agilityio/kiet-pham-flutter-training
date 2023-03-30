import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/home/best_place.dart';
import 'package:gotour_app/features/home/my_location.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/alert_dialog.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/search.dart';
import 'package:gotour_ui/core/widgets/text.dart';

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
    final device = GTReponsive.of(context);
    return GTScaffold(
      appBar: GTAppBar(
        leading: GTIconButton(
          icon: GTAssets().menu,
          btnColor: colorScheme.background,
          onPressed: () {},
        ),
        actionButtons: [
          Padding(
            padding: EdgeInsets.only(right: device.scale(10)),
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
                    title: S.of(context).LogOut,
                    content: S.of(context).logOutMessage,
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
              SizedBox(height: device.scale(40)),
              // Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: device.scale(20)),
                child: GTText.titleLarge(
                  context,
                  text: S.of(context).mainPageTitle,
                ),
              ),
              SizedBox(height: device.scale(30)),
              // Search Box
              const GTSearch(),
              SizedBox(height: device.scale(30)),
              // My Location
              const GTMyLocation(),
              SizedBox(height: device.scale(20)),
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
