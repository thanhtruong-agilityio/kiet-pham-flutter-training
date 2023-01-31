import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/widgets/title-and-button.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import 'elevated-button.dart';
import 'text-button.dart';

class GTBestPlace extends StatelessWidget {
  const GTBestPlace({
    super.key,
    required this.image,
    required this.location,
    required this.placeName,
    required this.price,
    required this.pressCard,
    required this.pressButton,
  });

  final String image, location, placeName, price;
  final Function pressCard, pressButton;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          GTTitleAndSeeAllBtn(title: 'BestPlace', press: pressButton),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GTCardBestPlace(
                  size: size,
                  image: image,
                  location: location,
                  placeName: placeName,
                  price: price,
                  press: pressCard,
                ),
                const SizedBox(width: 20),
                GTCardBestPlace(
                  size: size,
                  image: image,
                  location: location,
                  placeName: placeName,
                  price: price,
                  press: pressCard as Function,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GTCardBestPlace extends StatelessWidget {
  const GTCardBestPlace({
    Key? key,
    required this.size,
    required this.press,
    required this.image,
    required this.placeName,
    required this.location,
    required this.price,
  }) : super(key: key);

  final Size size;
  final Function press;
  final String image, placeName, location, price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as Function(),
      child: Container(
        margin: const EdgeInsets.only(
          left: 5,
          top: 14,
        ),
        width: size.width * 0.75,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                      Text(
                        placeName,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: ColorName.onSecondaryColor,
                            ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.location,
                            color: ColorName.onSecondaryColor,
                            width: 10,
                            height: 12,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            location,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: ColorName.onSecondaryColor,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 25,
                    child: GTElevatedButton(
                      text: Text(
                        '\$$price',
                        style: TextStyle(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                      activateShadowColor: false,
                      press: () {},
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
