import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/widgets/title-and-button.dart';

import 'elevated-button.dart';
import 'text-button.dart';

class PlaceInfo {
  final String image, location, placeName, price;
  const PlaceInfo(this.image, this.location, this.placeName, this.price);
}

class GTBestPlace extends StatefulWidget {
  const GTBestPlace({
    super.key,
    required this.pressCard,
    required this.pressBtn,
    required this.pressBtnPrice,
  });

  // final String image, location, placeName, price;
  final Function pressCard, pressBtn, pressBtnPrice;

  @override
  State<GTBestPlace> createState() => _GTBestPlaceState();
}

class _GTBestPlaceState extends State<GTBestPlace> {
  @override
  Widget build(BuildContext context) {
    List<PlaceInfo> data = [
      PlaceInfo('assets/images/Tibidabo.png', 'Da Nang, Viet Nam',
          'Bien Thanh Khe', '4 000'),
      PlaceInfo('assets/images/Tibidabo.png', 'Da Nang, Viet Nam',
          'Bien Thanh Khe', '3 000'),
      PlaceInfo('assets/images/Tibidabo.png', 'Da Nang, Viet Nam',
          'Bien Thanh Khe', '2 000'),
      PlaceInfo('assets/images/Tibidabo.png', 'Da Nang, Viet Nam',
          'Bien Thanh Khe', '1 000'),
    ];

    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.only(bottom: 14),
          child:
              GTTitleAndSeeAllBtn(title: 'BestPlace', press: widget.pressBtn),
        ),
        Row(
          children: [
            SizedBox(
              height: 180,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: GTCardBestPlace(
                    image: data[index].image,
                    placeName: data[index].placeName,
                    location: data[index].location,
                    price: data[index].price,
                    pressCard: widget.pressCard,
                    pressBtnPrice: widget.pressBtnPrice,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class GTCardBestPlace extends StatelessWidget {
  const GTCardBestPlace({
    Key? key,
    required this.image,
    required this.placeName,
    required this.location,
    required this.price,
    required this.pressCard,
    required this.pressBtnPrice,
  }) : super(key: key);

  final Function pressCard, pressBtnPrice;
  final String image, placeName, location, price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: pressCard as Function(),
      child: Container(
        width: size.width * 0.85,
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
                      press: pressBtnPrice,
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
