import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/router/named_location.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/home/best_place.dart';
import 'package:gotour_app/features/home/bloc/home_bloc.dart';
import 'package:gotour_app/features/home/my_location.dart';
import 'package:gotour_app/features/home/repository/home_repository.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/alert_dialog.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/search.dart';
import 'package:gotour_ui/core/widgets/snack_bar.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_ui/core/widgets/title.dart';

class GTHomePage extends StatelessWidget {
  const GTHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticatedState) {
          context.go('/login-page');
        }
        if (state is UnVerifyEmailState) {
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
          icon: GTAssets().icMenu,
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
                      context.read<AuthBloc>().add(SignOutRequestedEvent());
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
                    image: AssetImage(GTAssets().imgAvatarDefault),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: RepositoryProvider(
        create: (context) => HomeRepository(),
        child: BlocProvider(
          create: (context) => HomeBloc(
            mainRepository: RepositoryProvider.of<HomeRepository>(context),
          ),
          child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is UnBookmarkSuccessState) {
                GTSnackBar.success(
                  context,
                  message: S.of(context).unBookMarkSuccessMessage,
                );
              }
            },
            child: GestureDetector(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: device.scale(20)),
                      child: GTText.titleLarge(
                        context,
                        text: S.of(context).mainPageTitle,
                      ),
                    ),
                    SizedBox(height: device.scale(30)),
                    // Search Box
                    const GTSearch(),
                    SizedBox(height: device.scale(30)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GTText.titleMedium(
                        context,
                        text: S.of(context).mainPageMyLocation,
                      ),
                    ),
                    // My Location
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        // intial state
                        if (state is HomeInitialState) {
                          context.read<HomeBloc>().add(HomeFetchDataEvent());
                        }
                        // loading state
                        if (state is HomeLoadingState) {
                          return const GTMylocationShimmerList();
                        }
                        // success state
                        if (state is HomeLoadedState) {
                          if (state.myLocations.isEmpty) {
                            return SizedBox(
                              width: device.scale(375),
                              height: device.scale(150),
                              child: Center(
                                child: GTText.labelLarge(
                                  context,
                                  text: 'My Location is empty',
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            );
                          }
                          return GTMyLocation(
                            mylocatonList: state.myLocations,
                          );
                        }
                        return GTText.bodyLarge(context, text: 'Failed');
                      },
                    ),
                    SizedBox(height: device.scale(20)),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: device.scale(20)),
                      child: GTTitle(
                        title: S.of(context).mainPageBestPlace,
                        onPressed: () =>
                            context.pushNamed(RouterNamedLocation.bestPlace),
                      ),
                    ),
                    SizedBox(height: device.scale(14)),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is HomeInitialState) {
                          context.read<HomeBloc>().add(HomeFetchDataEvent());
                        }
                        if (state is HomeLoadingState) {
                          return const GTBestPlaceShimmerList();
                        }
                        if (state is HomeLoadedState) {
                          return GTBestPlace(
                            bestPlaceList: state.bestPlaces,
                          );
                        }
                        return const GTBestPlace(
                          bestPlaceList: [],
                        );
                      },
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
