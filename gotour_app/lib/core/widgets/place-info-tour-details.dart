import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/title-with-location.dart';

import 'card-image-with-bookmark.dart';

class GTPlaceInfoTourDetails extends StatelessWidget {
  const GTPlaceInfoTourDetails({
    super.key,
    required this.namePlace,
    required this.location,
    required this.price,
    required this.size,
    required this.weather,
    required this.pressCard,
    required this.pressBtn,
  });

  final String namePlace, location, price, weather;
  final Size size;
  final Function pressCard, pressBtn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListCardPlaceinfo(
          size: size,
          press: pressCard as Function(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GTTitleWithLocation(
                  placeName: namePlace,
                  location: location,
                ),
                const SizedBox(height: 24),
                Button(context),
              ],
            ),
            Weather(context)
          ],
        ),
      ],
    );
  }

  SizedBox Button(BuildContext context) {
    return SizedBox(
      height: 25,
      child: GTElevatedButton(
        activateShadowColor: false,
        text: Text(
          '\$$price',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: ColorName.backgroundColor),
        ),
        press: pressBtn,
      ),
    );
  }

  Row LocationDetails(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.icons.location,
          color: ColorName.primaryColor,
          width: 10,
          height: 12,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          location,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: ColorName.iconsColor,
              ),
        ),
      ],
    );
  }

  Text Title(BuildContext context) {
    return Text(
      namePlace,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  Row Weather(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.icons.cloud),
        SizedBox(width: 7),
        Text(
          '$weather°C',
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
    Key? key,
    required this.size,
    required this.press,
  }) : super(key: key);

  final Size size;
  final Function press;

  @override
  State<ListCardPlaceinfo> createState() => _ListCardPlaceinfoState();
}

class _ListCardPlaceinfoState extends State<ListCardPlaceinfo> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<String> images = [
    'assets/images/Tibidabo.png',
    'assets/images/Tibidabo.png',
    'assets/images/Tibidabo.png',
    'assets/images/ChumPhon.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
    'assets/images/Kyoto.png',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            itemBuilder: (context, index) => GTCardImageWithBookmark(
              size: size,
              images: images[index],
              press: widget.press as Function(),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          height: 5,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 25.0 + (images.length - 1) * 10,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) => buildIndicator(
                  index == _selectedIndex,
                  size,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildIndicator(bool isActivate, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.5),
      height: isActivate ? 3 : 5,
      width: isActivate ? 20 : 5,
      decoration: BoxDecoration(
        color: ColorName.sliderColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
