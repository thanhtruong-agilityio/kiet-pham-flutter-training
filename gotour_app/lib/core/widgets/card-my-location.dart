import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/title-and-button.dart';

import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/title-with-location.dart';

class LocationInfo {
  final String image, location, placeName, description;
  const LocationInfo(
      this.image, this.location, this.placeName, this.description);
}

class GTMyLocation extends StatelessWidget {
  const GTMyLocation({
    super.key,
    required this.press,
  });

  final Function press;

  @override
  Widget build(BuildContext context) {
    List<LocationInfo> data = [
      LocationInfo(
          'assets/images/tibidabo.png',
          'Da Nang, Viet Nam',
          'Bien Thanh Khe',
          "Portugal there's so much more to discover. Read about the Azores' new wave of eco-travel."),
      LocationInfo(
          'assets/images/tibidabo.png',
          'Quang Nam, Viet Nam',
          'Bien Thanh Khe',
          "Portugal there's so much more to discover. Read about the Azores' new wave of eco-travel."),
      LocationInfo(
          'assets/images/tibidabo.png',
          'Hue, Viet Nam',
          'Bien Thanh Khe',
          "Portugal there's so much more to discover. Read about the Azores' new wave of eco-travel."),
      LocationInfo(
          'assets/images/tibidabo.png',
          'Hoi An, Viet Nam',
          'Bien Thanh Khe',
          "Portugal there's so much more to discover. Read about the Azores' new wave of eco-travel."),
    ];
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GTText.TitleMedium(context, 'My Location'),
            ),
            Spacer(),
          ],
        ),
        SizedBox(
          height: 180,
          width: size.width,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(right: 20),
              child: GTCardMyLocation(
                press: press,
                image: data[index].image,
                placeName: data[index].placeName,
                location: data[index].location,
                description: data[index].description,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class GTCardMyLocation extends StatefulWidget {
  const GTCardMyLocation({
    Key? key,
    required this.press,
    required this.image,
    required this.placeName,
    required this.location,
    required this.description,
  }) : super(key: key);

  final Function press;
  final String image, placeName, location, description;

  @override
  State<GTCardMyLocation> createState() => _GTCardMyLocationState();
}

class _GTCardMyLocationState extends State<GTCardMyLocation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.press as Function(),
      child: Container(
        margin: const EdgeInsets.only(
          left: 5,
          top: 14,
        ),
        width: size.width * 0.75,
        height: 136,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorName.surfaceColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                imagePlace(),
                                const SizedBox(width: 11),
                                GTTitleWithLocation(
                                  placeName: widget.placeName,
                                  location: widget.location,
                                  colorIcon: ColorName.primaryColor,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      iconBookMark()
                    ],
                  ),
                  const SizedBox(height: 11),
                  Container(
                    padding: const EdgeInsets.only(right: 39),
                    child: GTText.bodyMedium(
                      context,
                      widget.description,
                      color: ColorName.iconsColor,
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

  GestureDetector iconBookMark() {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: SvgPicture.asset(
        Assets.icons.bookMark,
        color: ColorName.primaryColor,
      ),
    );
  }

  Container imagePlace() {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorName.primaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(widget.image),
        ),
      ),
    );
  }
}
