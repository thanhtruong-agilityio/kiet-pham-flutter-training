import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/widgets/app_bar.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/features/auth/bloc/auth_bloc.dart';
import 'package:gotour_app/features/tour_details/bloc/tour_details_bloc.dart';
import 'package:gotour_app/features/tour_details/place_info.dart';
import 'package:gotour_app/features/tour_details/repository/tour_details_repository.dart';
import 'package:gotour_app/features/tour_details/service.dart';

class GTTourDetails extends StatelessWidget {
  const GTTourDetails({
    super.key,
    this.id,
  });

  final String? id;

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
      child: _GTTourDetails(id),
    );
  }
}

class _GTTourDetails extends StatelessWidget {
  const _GTTourDetails(this.id);

  final String? id;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GTScaffold(
      appBar: GTAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GTIconButton(
            icon: Assets.icons.back,
            btnColor: colorScheme.background,
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
        actionButtons: [
          GTIconButton(
            icon: Assets.icons.notification,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
          GTIconButton(
            icon: Assets.icons.more,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: RepositoryProvider(
          create: (context) => TourDetailsRepository(),
          child: BlocProvider(
            create: (context) => TourDetailsBloc(
              tourDetailsRepository:
                  RepositoryProvider.of<TourDetailsRepository>(context),
            ),
            child: BlocBuilder<TourDetailsBloc, TourDetailsState>(
              builder: (context, state) {
                if (state is TourDetailsInitialState) {
                  context.read<TourDetailsBloc>().add(
                        TourDetailsFetchDataEvent(
                          id: id!,
                        ),
                      );
                  return Center(
                    child: GTText.bodyLarge(context, text: 'initial'),
                  );
                }
                if (state is TourDetailsLoadingState) {
                  return Center(
                    child: GTText.bodyLarge(context, text: 'Loading'),
                  );
                }
                if (state is TourDetailsLoadedState) {
                  final data = state.tourDetails;
                  return Column(
                    children: [
                      const SizedBox(height: 44),
                      GTPlaceInfoTourDetails(
                        namePlace: data.placeName,
                        location: data.location,
                        price: data.price,
                        temperature: data.weather,
                        onPressCard: () {},
                        onPressBtn: () {},
                      ),
                      const SizedBox(height: 26),
                      const GTService(),
                      const SizedBox(height: 26),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: GTText.bodyMedium(
                          context,
                          text: data.descriptions,
                          color: colorScheme.secondary,
                        ),
                      )
                    ],
                  );
                }
                return Center(
                  child: GTText.bodyLarge(context, text: 'Failed'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
