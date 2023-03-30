import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_app/features/tour_details/bloc/tour_details_bloc.dart';
import 'package:gotour_app/features/tour_details/repository/tour_details_repository.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/shared/snack_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/location.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTPlaceInfoTourDetails extends StatelessWidget {
  const GTPlaceInfoTourDetails({
    super.key,
    required this.namePlace,
    required this.location,
    required this.price,
    required this.temperature,
    required this.onPressCard,
    required this.onPressBtn,
    required this.id,
  });

  final String namePlace;
  final String location;
  final String price;
  final String temperature;
  final VoidCallback onPressCard;
  final VoidCallback onPressBtn;
  final String id;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);

    return Column(
      children: [
        ListCardPlaceinfo(
          onPressed: onPressCard,
          id: id,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: device.scale(20),
            right: device.scale(20),
            top: device.scale(28),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GTLocation(
                    placeName: namePlace,
                    location: location,
                    colorLocation: colorScheme.tertiary,
                    colorIcon: colorScheme.primary,
                  ),
                  SizedBox(height: device.scale(24)),
                  SizedBox(
                    height: device.scale(25),
                    child: GTElevatedHighlightButton(
                      text: '\$$price',
                      onPressed: onPressBtn,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(GTAssets().cloud),
                  SizedBox(width: device.scale(7)),
                  Text(
                    '$temperature°C',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ListCardPlaceinfo extends StatefulWidget {
  const ListCardPlaceinfo({
    super.key,
    required this.onPressed,
    required this.id,
  });

  final VoidCallback onPressed;
  final String id;

  @override
  State<ListCardPlaceinfo> createState() => _ListCardPlaceinfoState();
}

class _ListCardPlaceinfoState extends State<ListCardPlaceinfo> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  List<String> images = [];
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);
    return RepositoryProvider(
      create: (context) => TourDetailsRepository(),
      child: BlocProvider(
        create: (context) => TourDetailsBloc(
          tourDetailsRepository:
              RepositoryProvider.of<TourDetailsRepository>(context),
        ),
        child: BlocListener<TourDetailsBloc, TourDetailsState>(
          listener: (context, state) {
            if (state is ChangeBookmarkSuccessState) {
              if (state.bookmark == true) {
                GTSnackBar.show(
                  context,
                  message: S.of(context).bookMarkSuccessMessage,
                  backgroundColor: colorScheme.secondaryContainer,
                );
              } else {
                GTSnackBar.show(
                  context,
                  message: S.of(context).unBookMarkSuccessMessage,
                  backgroundColor: colorScheme.secondaryContainer,
                );
              }
            }
          },
          child: BlocBuilder<TourDetailsBloc, TourDetailsState>(
            builder: (context, state) {
              if (state is TourDetailsInitialState) {
                context
                    .read<TourDetailsBloc>()
                    .add(TourDetailsFetchImageListEvent(id: widget.id));
              }
              if (state is TourDetailsLoadingState) {
                return Center(
                  child: GTText.bodyLarge(context, text: 'Loading'),
                );
              }
              if (state is TourDetailsImageListLoadedState) {
                images = state.imageList;
                final isBookmark = state.bookmark;
                return Column(
                  children: [
                    SizedBox(
                      height: device.scale(200),
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        itemCount: images.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: device.scale(20)),
                          child: GestureDetector(
                            onTap: widget.onPressed,
                            child: Stack(
                              children: [
                                Container(
                                  height: device.scale(200),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(images[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: device.scale(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            BlocBuilder<TourDetailsBloc,
                                                TourDetailsState>(
                                              builder: (context, state) {
                                                return InkWell(
                                                  onTap: () {
                                                    context
                                                        .read<TourDetailsBloc>()
                                                        .add(
                                                          PressTheTourBookmarkButtonEvent(
                                                            tourId: widget.id,
                                                            isBookmark:
                                                                isBookmark,
                                                          ),
                                                        );
                                                  },
                                                  child: SvgPicture.asset(
                                                    GTAssets().bookMark,
                                                    color: isBookmark
                                                        ? colorScheme.primary
                                                        : colorScheme
                                                            .background,
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: device.scale(15)),
                      height: 5,
                      child: Align(
                        child: SizedBox(
                          width: 25.0 + (images.length - 1) * 10,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            // itemBuilder: (context, index) => buildIndicator(
                            //   isActivate: index == _selectedIndex,
                            //   size: size,
                            // ),
                            itemBuilder: (context, index) => Center(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.5),
                                height: index == _selectedIndex ? 3 : 5,
                                width: index == _selectedIndex ? 20 : 5,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiaryContainer,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ),
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
    );
  }
}
