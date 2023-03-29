import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_app/features/tour_details/bloc/tour_details_bloc.dart';
import 'package:gotour_app/features/tour_details/repository/tour_details_repository.dart';
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
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ListCardPlaceinfo(
          size: size,
          onPressed: onPressCard,
          id: id,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 28),
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
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 25,
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
                  const SizedBox(width: 7),
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
    required this.size,
    required this.onPressed,
    required this.id,
  });

  final Size size;
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
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return RepositoryProvider(
      create: (context) => TourDetailsRepository(),
      child: BlocProvider(
        create: (context) => TourDetailsBloc(
          tourDetailsRepository:
              RepositoryProvider.of<TourDetailsRepository>(context),
        ),
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
                    height: size.height * 1 / 4,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      itemCount: images.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: GestureDetector(
                          onTap: widget.onPressed,
                          child: Stack(
                            children: [
                              Container(
                                height: size.height * 1 / 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(images[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .read<TourDetailsBloc>()
                                                  .add(
                                                    pressTheTourBookmarkButtonEvent(
                                                      tourId: widget.id,
                                                    ),
                                                  );
                                            },
                                            child: BlocBuilder<TourDetailsBloc,
                                                TourDetailsState>(
                                              builder: (context, state) {
                                                if (state
                                                    is TourDetailsImageListLoadedState) {
                                                  return SvgPicture.asset(
                                                    GTAssets().bookMark,
                                                    color: state.bookmark
                                                        ? colorScheme.primary
                                                        : colorScheme
                                                            .background,
                                                  );
                                                }
                                                if (state
                                                    is BookMarkTheTourLoadingState) {
                                                  return CircularProgressIndicator(
                                                    color: colorScheme.primary,
                                                  );
                                                }
                                                if (state
                                                    is BookMarkTheTourSuccessState) {
                                                  return SvgPicture.asset(
                                                    GTAssets().bookMark,
                                                    color: state.bookmark
                                                        ? colorScheme.primary
                                                        : colorScheme
                                                            .background,
                                                  );
                                                }
                                                return GTText.bodyLarge(
                                                  context,
                                                  text: 'failing',
                                                );
                                              },
                                            ),
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
                    margin: const EdgeInsets.only(top: 15),
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
    );
  }
}

// Column(
//               children: [
//                 SizedBox(
//                   height: size.height * 1 / 4,
//                   child: PageView.builder(
//                     controller: _pageController,
//                     onPageChanged: (index) {
//                       setState(() {
//                         _selectedIndex = index;
//                       });
//                     },
//                     itemCount: images.length,
//                     itemBuilder: (context, index) => Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20),
//                       child: GestureDetector(
//                         onTap: widget.onPressed,
//                         child: Stack(
//                           children: [
//                             Container(
//                               height: size.height * 1 / 4,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 image: DecorationImage(
//                                   image: NetworkImage(images[index]),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 30),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Stack(
//                                       children: [
//                                         SvgPicture.asset(
//                                           GTAssets().bookMark,
//                                           color: colorScheme.background,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 15),
//                   height: 5,
//                   child: Align(
//                     child: SizedBox(
//                       width: 25.0 + (images.length - 1) * 10,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: images.length,
//                         // itemBuilder: (context, index) => buildIndicator(
//                         //   isActivate: index == _selectedIndex,
//                         //   size: size,
//                         // ),
//                         itemBuilder: (context, index) => Center(
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 300),
//                             margin: const EdgeInsets.symmetric(horizontal: 2.5),
//                             height: index == _selectedIndex ? 3 : 5,
//                             width: index == _selectedIndex ? 20 : 5,
//                             decoration: BoxDecoration(
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .tertiaryContainer,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )