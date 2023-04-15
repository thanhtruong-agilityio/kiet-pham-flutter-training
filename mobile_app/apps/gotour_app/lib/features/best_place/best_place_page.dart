import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/core/model/tour_model.dart';
import 'package:gotour_app/core/router/named_location.dart';
import 'package:gotour_app/features/best_place/bloc/best_place_bloc.dart';
import 'package:gotour_app/features/best_place/repository/best_place_repository.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/indicator.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/search_box.dart';
import 'package:gotour_ui/core/widgets/tag.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTBestPlacePage extends StatelessWidget {
  const GTBestPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTResponsive.of(context);
    var data = <TourModel>[];
    final value = TextEditingController();

    return GTScaffold(
      appBar: GTAppBar(
        leading: GTIconButton(
          icon: GTAssets.icArrowBack,
          btnColor: colorScheme.background,
          onPressed: () => context.pop(),
        ),
        actionButtons: [
          GTIconButton(
            icon: GTAssets.icNotification,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => BestPlaceBloc(
          bestPlaceRepository: BestPlaceRepository(),
        ),
        child: BlocConsumer<BestPlaceBloc, BestPlaceState>(
          listener: (context, state) {
            if (state is BestPlaceLoadingState) {
              gtIndicatorOverlay.show(context, S.of(context).loading);
            } else {
              gtIndicatorOverlay.hide(context);
            }

            if (state is BestPlaceSearchSuccessState) {
              data = state.response;
            }
          },
          builder: (context, state) {
            if (state is BestPlaceInitial) {
              context.read<BestPlaceBloc>().add(BestPlaceFetchDataEvent());
            }

            if (state is BestPlaceLoadedState) {
              data = state.bestPlaceList;

              if (data.isEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<BestPlaceBloc>()
                        .add(BestPlaceFetchDataEvent());
                  },
                  child: Column(
                    children: [
                      SizedBox(height: device.scale(44)),
                      GTSearchBox(
                        controller: value,
                        onClear: value.clear,
                        onPressed: () {
                          context
                              .read<BestPlaceBloc>()
                              .add(BestPlaceSearchEvent(value: value.text));
                        },
                      ),
                      SizedBox(height: device.scale(20)),
                      const Spacer(),
                      Center(
                        child: GTText.labelMedium(
                          context,
                          text: S.of(context).bestPlaceCouldNotBeFound,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  context.read<BestPlaceBloc>().add(BestPlaceFetchDataEvent());
                },
                child: Column(
                  children: [
                    SizedBox(height: device.scale(44)),
                    GTSearchBox(
                      controller: value,
                      onClear: value.clear,
                      onPressed: () {
                        context
                            .read<BestPlaceBloc>()
                            .add(BestPlaceSearchEvent(value: value.text));
                      },
                    ),
                    SizedBox(height: device.scale(20)),
                    // best place list
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return _CardBestPlace(
                            placeName: data[index].placeName,
                            location: data[index].location,
                            price: data[index].price,
                            imageUrl: data[index].imageUrl,
                            tags: data[index].tagList,
                            onPressed: () => context.pushNamed(
                              RouterNamedLocation.tourDetails,
                              params: {'id': data[index].id},
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is BestPlaceSearchSuccessState) {}
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _CardBestPlace extends StatelessWidget {
  const _CardBestPlace({
    required this.imageUrl,
    required this.placeName,
    this.location = '',
    this.price = '',
    this.tags = const [],
    this.onPressed,
  });

  final String placeName;
  final String location;
  final String price;
  final String imageUrl;
  final List<String> tags;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final device = GTResponsive.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: device.scale(5),
        horizontal: device.scale(20),
      ),
      child: SizedBox(
        height: device.scale(132),
        width: device.scale(335),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          child: InkWell(
            onTap: onPressed,
            child: Row(
              children: [
                SizedBox(width: device.scale(15)),
                // image
                Expanded(
                  child: GTNetWorkImage(
                    image: imageUrl,
                    width: device.scale(70),
                    height: device.scale(92),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: device.scale(11),
                      top: device.scale(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // place name
                                  GTText.titleSmall(
                                    context,
                                    text: placeName,
                                  ),
                                  SizedBox(
                                    height: device.scale(6),
                                  ),
                                  // icon
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        GTAssets.icLocation,
                                        color: colorScheme.primary,
                                        width: device.scale(10),
                                        height: device.scale(12),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: device.scale(9),
                                        ),
                                        // location
                                        child: GTText.labelMedium(
                                          context,
                                          text: location,
                                          color: colorScheme.tertiary,
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: device.scale(19),
                                        ),
                                        // price
                                        child: SizedBox(
                                          height: 25,
                                          child: GTElevatedHighlightButton(
                                            text: '\$$price',
                                            onPressed: () {},
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: device.scale(10),
                              ),
                              // tag list
                              Row(
                                children: List.generate(
                                  tags.length,
                                  (index) => Container(
                                    margin: EdgeInsets.only(
                                      right: device.scale(12),
                                    ),
                                    child: GTTag(text: tags[index]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
