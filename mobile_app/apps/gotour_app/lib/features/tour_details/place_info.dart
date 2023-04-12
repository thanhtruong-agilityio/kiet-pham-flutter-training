import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/features/tour_details/bloc/tour_details_bloc.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/location.dart';

class GTPlaceInfo extends StatelessWidget {
  const GTPlaceInfo({
    super.key,
    required this.namePlace,
    required this.location,
    this.price = '',
    this.temperature = '',
    this.isBookmark = false,
    this.imageList = const [],
    this.onPressed,
    this.onBookmark,
  });

  final String namePlace;
  final String location;
  final String? price;
  final String? temperature;
  final VoidCallback? onPressed;
  final bool? isBookmark;
  final List<String>? imageList;
  final VoidCallback? onBookmark;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);

    return Column(
      children: [
        ListCardPlaceinfo(
          isBookmark: isBookmark,
          imageList: imageList ?? [],
          onBookmark: onBookmark ?? () {},
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
                      onPressed: onPressed ?? () {},
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(GTAssets.icCloud),
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
    required this.imageList,
    this.isBookmark,
    this.onBookmark,
  });

  final bool? isBookmark;
  final List<String> imageList;
  final VoidCallback? onBookmark;

  @override
  State<ListCardPlaceinfo> createState() => _ListCardPlaceinfoState();
}

class _ListCardPlaceinfoState extends State<ListCardPlaceinfo> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);
    final images = widget.imageList;

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
                horizontal: device.scale(20),
              ),
              child: Stack(
                children: [
                  GTNetWorkImage(
                    image: images[index],
                    width: device.scale(335),
                    height: device.scale(200),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: device.scale(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              BlocBuilder<TourDetailsBloc, TourDetailsState>(
                                builder: (context, state) {
                                  return InkWell(
                                    onTap: widget.onBookmark,
                                    child: SvgPicture.asset(
                                      GTAssets.icBookMark,
                                      color: widget.isBookmark ?? false
                                          ? colorScheme.primary
                                          : colorScheme.background,
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
        Container(
          margin: EdgeInsets.only(top: device.scale(15)),
          height: 5,
          child: Align(
            child: SizedBox(
              // calculate width of active item
              width: 25.0 + (images.length - 1) * 10,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) => Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 2.5),
                    height: index == _selectedIndex ? 3 : 5,
                    width: index == _selectedIndex ? 20 : 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
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
}
