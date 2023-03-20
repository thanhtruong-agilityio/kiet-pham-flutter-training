import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/location.dart';
import 'package:gotour_app/core/widgets/place_image.dart';

class GTPlaceInfoTourDetails extends StatelessWidget {
  const GTPlaceInfoTourDetails({
    super.key,
    required this.namePlace,
    required this.location,
    required this.price,
    required this.temperature,
    required this.onPressCard,
    required this.onPressBtn,
  });

  final String namePlace;
  final String location;
  final String price;
  final String temperature;
  final VoidCallback onPressCard;
  final VoidCallback onPressBtn;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ListCardPlaceinfo(
          size: size,
          onPress: onPressCard,
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
                    colorLocation: ColorName.iconsColor,
                    colorIcon: ColorName.primaryColor,
                  ),
                  const SizedBox(height: 24),
                  button(context),
                ],
              ),
              weather(context)
            ],
          ),
        ),
      ],
    );
  }

  SizedBox button(BuildContext context) {
    return SizedBox(
      height: 25,
      child: GTElevatedHighlightButton(
        text: '\$$price',
        onPressed: onPressBtn,
      ),
    );
  }

  Row weather(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.icons.cloud),
        const SizedBox(width: 7),
        Text(
          '$temperature°C',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: ColorName.iconsColor),
        ),
      ],
    );
  }
}

class ListCardPlaceinfo extends StatefulWidget {
  const ListCardPlaceinfo({
    super.key,
    required this.size,
    required this.onPress,
  });

  final Size size;
  final VoidCallback onPress;

  @override
  State<ListCardPlaceinfo> createState() => _ListCardPlaceinfoState();
}

class _ListCardPlaceinfoState extends State<ListCardPlaceinfo> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  List<String> images = [
    Assets.images.tibidabo.path,
    Assets.images.krabi.path,
    Assets.images.doipui.path,
    Assets.images.canyon.path,
    Assets.images.phranang.path,
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              child: GTCardImageWithBookmark(
                size: size,
                images: images[index],
                press: widget.onPress,
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
                itemBuilder: (context, index) => buildIndicator(
                  isActivate: index == _selectedIndex,
                  size: size,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildIndicator({required bool isActivate, required Size size}) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        height: isActivate ? 3 : 5,
        width: isActivate ? 20 : 5,
        decoration: BoxDecoration(
          color: ColorName.sliderColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
