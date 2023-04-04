import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/router/named_location.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/features/tour_details/bloc/tour_details_bloc.dart';
import 'package:gotour_app/features/tour_details/place_info.dart';
import 'package:gotour_app/features/tour_details/repository/tour_details_repository.dart';
import 'package:gotour_app/features/tour_details/service.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/snack_bar.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTTourDetails extends StatelessWidget {
  const GTTourDetails({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);

    return GTScaffold(
      appBar: GTAppBar(
        leading: Padding(
          padding: EdgeInsets.only(right: device.scale(10)),
          child: GTIconButton(
            icon: GTAssets().icArrowBack,
            btnColor: colorScheme.background,
            onPressed: () =>
                context.pushReplacementNamed(RouterNamedLocation.home),
          ),
        ),
        actionButtons: [
          GTIconButton(
            icon: GTAssets().icNotification,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
          GTIconButton(
            icon: GTAssets().icMore,
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
            child: BlocListener<TourDetailsBloc, TourDetailsState>(
              listener: (context, state) {
                if (state is ChangeBookmarkSuccessState) {
                  if (state.isBookmark == true) {
                    GTSnackBar.success(
                      context,
                      message: S.of(context).bookMarkSuccessMessage,
                    );
                  } else {
                    GTSnackBar.success(
                      context,
                      message: S.of(context).unBookMarkSuccessMessage,
                    );
                  }
                }
              },
              child: BlocBuilder<TourDetailsBloc, TourDetailsState>(
                builder: (context, state) {
                  if (state is TourDetailsInitialState) {
                    context.read<TourDetailsBloc>().add(
                          TourDetailsFetchDataEvent(
                            id: id,
                          ),
                        );
                  }
                  if (state is TourDetailsLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colorScheme.primary,
                      ),
                    );
                  }
                  if (state is TourDetailsLoadedState) {
                    final data = state.tourDetails;

                    return Column(
                      children: [
                        SizedBox(height: device.scale(44)),
                        GTPlaceInfoTourDetails(
                          namePlace: data.placeName,
                          location: data.location,
                          price: data.price,
                          temperature: data.weather,
                          isBookmark: state.isBookmark,
                          imageList: data.imageList,
                          onPressBtn: () {},
                          onBookmark: () {
                            context.read<TourDetailsBloc>().add(
                                  PressTheTourBookmarkButtonEvent(
                                    isBookmark: state.isBookmark,
                                    tourId: data.id,
                                  ),
                                );
                          },
                        ),
                        SizedBox(height: device.scale(26)),
                        const GTService(),
                        SizedBox(height: device.scale(26)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: device.scale(20),
                          ),
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
      ),
    );
  }
}
