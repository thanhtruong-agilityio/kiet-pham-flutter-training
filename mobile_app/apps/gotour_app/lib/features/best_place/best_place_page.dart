import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/core/router/named_location.dart';
import 'package:gotour_app/features/best_place/bloc/best_place_bloc.dart';
import 'package:gotour_app/features/best_place/model/best_place.dart';
import 'package:gotour_app/features/best_place/repository/best_place_repository.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/search.dart';
import 'package:gotour_ui/core/widgets/tag.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTBestPlacePage extends StatelessWidget {
  const GTBestPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);
    var data = <BestPlace>[];

    return GTScaffold(
      appBar: GTAppBar(
        leading: GTIconButton(
          icon: GTAssets().icArrowBack,
          btnColor: colorScheme.background,
          onPressed: () => context.pop(),
        ),
        actionButtons: [
          GTIconButton(
            icon: GTAssets().icNotification,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
      body: RepositoryProvider(
        create: (context) => BestPlaceRepository(),
        child: BlocProvider(
          create: (context) => BestPlaceBloc(
            bestPlaceRepository:
                RepositoryProvider.of<BestPlaceRepository>(context),
          ),
          child: BlocBuilder<BestPlaceBloc, BestPlaceState>(
            builder: (context, state) {
              if (state is BestPlaceInitial) {
                context.read<BestPlaceBloc>().add(BestPlaceFetchDataEvent());
              }
              if (state is BestPlaceLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colorScheme.primary,
                  ),
                );
              }
              if (state is BestPlaceLoadedState) {
                data = state.bestPlaceList;
                return RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<BestPlaceBloc>()
                        .add(BestPlaceFetchDataEvent());
                  },
                  child: Column(
                    children: [
                      SizedBox(height: device.scale(44)),
                      const GTSearch(),
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
                              tag: data[index].tagList,
                              onPressed: () => context.pushNamed(
                                RouterNamedLocation.hotPlace,
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
              return GTText.bodyLarge(context, text: 'fail');
            },
          ),
        ),
      ),
    );
  }
}

class _CardBestPlace extends StatelessWidget {
  const _CardBestPlace({
    required this.placeName,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.tag,
    required this.onPressed,
  });

  final String placeName;
  final String location;
  final String price;
  final String imageUrl;
  final List<String> tag;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);
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
                  child: Container(
                    height: device.scale(92),
                    width: device.scale(70),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
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
                                        GTAssets().icLocation,
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
                                  tag.length,
                                  (index) => Container(
                                    margin: EdgeInsets.only(
                                      right: device.scale(12),
                                    ),
                                    child: GTTag(text: tag[index]),
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
