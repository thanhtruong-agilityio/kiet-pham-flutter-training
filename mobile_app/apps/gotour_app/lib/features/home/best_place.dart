import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_app/features/home/models/best_place.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/location.dart';

class GTBestPlace extends StatelessWidget {
  const GTBestPlace({
    super.key,
    required this.bestPlaceList,
  });

  final List<BestPlace> bestPlaceList;

  @override
  Widget build(BuildContext context) {
    final data = bestPlaceList;

    final device = GTReponsive.of(context);
    return SizedBox(
      height: device.scale(180),
      width: device.scale(375),
      child: ListView.builder(
        padding: EdgeInsets.only(left: device.scale(20)),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(right: device.scale(20)),
          child: GTCardBestPlace(
            image: data[index].imageUrl,
            placeName: data[index].placeName,
            location: data[index].location,
            price: data[index].price,
            pressCard: () => context.pushNamed(
              'hot-place',
              params: {'id': data[index].id},
            ),
            pressBtnPrice: () {},
          ),
        ),
      ),
    );
  }
}

class GTCardBestPlace extends StatelessWidget {
  const GTCardBestPlace({
    super.key,
    required this.image,
    required this.placeName,
    required this.location,
    required this.price,
    required this.pressCard,
    required this.pressBtnPrice,
  });

  final VoidCallback pressCard;
  final VoidCallback pressBtnPrice;
  final String image;
  final String placeName;
  final String location;
  final String price;

  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: pressCard,
      child: Container(
        width: device.scale(295),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: device.scale(20),
            horizontal: device.scale(15),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GTLocation(
                        placeName: placeName,
                        location: location,
                        colorIcon: colorScheme.background,
                        colorLocation: colorScheme.background,
                        colorName: colorScheme.background,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: device.scale(25),
                    child: GTElevatedHighlightButton(
                      text: '\$$price',
                      onPressed: pressBtnPrice,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GTBestPlaceShimmerList extends StatelessWidget {
  const GTBestPlaceShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);

    return SizedBox(
      height: device.scale(180),
      width: device.scale(375),
      child: ListView.builder(
        padding: EdgeInsets.only(left: device.scale(20)),
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) => const _ShimmerLayout(),
      ),
    );
  }
}

class _ShimmerLayout extends StatelessWidget {
  const _ShimmerLayout();

  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(right: device.scale(20)),
      child: Container(
        width: device.scale(295),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.surface,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: device.scale(20),
            horizontal: device.scale(15),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorScheme.onSecondaryContainer,
                            ),
                            height: 20,
                            width: 139,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorScheme.onSecondaryContainer,
                            ),
                            width: 120,
                            height: 16,
                            padding: const EdgeInsets.only(left: 9),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: device.scale(25),
                    width: device.scale(60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorScheme.onSecondaryContainer,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
