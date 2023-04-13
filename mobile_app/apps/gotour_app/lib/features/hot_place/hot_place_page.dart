import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/core/router/named_location.dart';
import 'package:gotour_app/features/hot_place/bloc/hot_place_bloc.dart';
import 'package:gotour_app/features/hot_place/hot_place.dart';
import 'package:gotour_app/features/hot_place/place_info.dart';
import 'package:gotour_app/features/hot_place/repository/hot_place_repository.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/indicator.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/snack_bar.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTHotPlace extends StatelessWidget {
  const GTHotPlace({
    super.key,
    required this.id,
  });

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
            icon: GTAssets.icArrowBack,
            btnColor: colorScheme.background,
            onPressed: () =>
                context.pushReplacementNamed(RouterNamedLocation.home),
          ),
        ),
        actionButtons: [
          GTIconButton(
            icon: GTAssets.icNotification,
            btnColor: colorScheme.background,
            onPressed: () {
              // TODO(KietPham): show notification
            },
          ),
          GTIconButton(
            icon: GTAssets.icMore,
            btnColor: colorScheme.background,
            onPressed: () {
              // TODO(KietPham): show more
            },
          ),
        ],
      ),
      body: RepositoryProvider(
        create: (context) => HotPlaceRepository(),
        child: BlocProvider(
          create: (context) => HotPlaceBloc(
            hotPlaceRepository:
                RepositoryProvider.of<HotPlaceRepository>(context),
          ),
          child: BlocListener<HotPlaceBloc, HotPlaceState>(
            listener: (context, state) {
              if (state is ChangeBookmarkHotPlaceSuccessState) {
                if (state.bookmark == true) {
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

              if (state is ChangeBookmarkHotPlaceErrorState) {
                GTSnackBar.failure(context, message: state.error);
              }

              if (state is HotPlaceLoadingState) {
                gtIndicatorOverlay.show(context, S.of(context).loading);
              } else {
                gtIndicatorOverlay.hide(context);
              }
            },
            child: BlocBuilder<HotPlaceBloc, HotPlaceState>(
              builder: (context, state) {
                if (state is HotPlaceInitialState) {
                  context
                      .read<HotPlaceBloc>()
                      .add(HotPlaceFetchDataEvent(tourId: id));
                }
                if (state is HotPlaceLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: colorScheme.primary,
                    ),
                  );
                }
                if (state is HotPlaceLoadedState) {
                  final data = state.hotPlace;
                  final isBookMark = state.isBookMark;

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: device.scale(20)),
                    child: Column(
                      children: [
                        SizedBox(height: device.scale(44)),
                        GTPlaceInfoHotPlace(
                          image: data.imageUrl,
                          placeName: data.placeName,
                          location: data.location,
                          price: data.price,
                          tagList: data.tagList,
                          isBookmark: isBookMark,
                          onBookmark: () {
                            context.read<HotPlaceBloc>().add(
                                  PressTheBookmarkButtonEvent(
                                    isBookmark: isBookMark,
                                    tourId: id,
                                  ),
                                );
                          },
                        ),
                        SizedBox(height: device.scale(25)),
                        Expanded(
                          child: GTGridViewHotPlace(
                            imageList: data.imageList,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(child: GTText.bodyLarge(context, text: 'fail'));
              },
            ),
          ),
        ),
      ),
    );
  }
}
