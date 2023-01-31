import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gotour_app/widgets/title-and-button.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import 'GTTitle.dart';

class GTMyLocation extends StatelessWidget {
  const GTMyLocation({
    super.key,
    required this.image,
    required this.location,
    required this.namePlace,
    required this.description,
    required this.press,
  });

  final String image, location, namePlace, description;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              GTTitle(title: 'My Location'),
              Spacer(),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GTCardMyLocation(
                  press: press,
                  image: image,
                  location: location,
                  namePlace: namePlace,
                  description: description,
                ),
                const SizedBox(width: 20),
                GTCardMyLocation(
                  press: press,
                  image: image,
                  location: location,
                  namePlace: namePlace,
                  description: description,
                ),
                SizedBox(width: 20),
                GTCardMyLocation(
                  press: press,
                  image: image,
                  location: location,
                  namePlace: namePlace,
                  description: description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GTCardMyLocation extends StatelessWidget {
  const GTCardMyLocation({
    Key? key,
    required this.press,
    required this.image,
    required this.namePlace,
    required this.location,
    required this.description,
  }) : super(key: key);

  final Function press;
  final String image, namePlace, location, description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press as Function(),
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
                                SizedBox(width: 11),
                                nameAndLocation(context),
                              ],
                            )
                          ],
                        ),
                      ),
                      iconBookMark()
                    ],
                  ),
                  SizedBox(height: 11),
                  Container(
                    padding: EdgeInsets.only(right: 39),
                    child: Text(
                      description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorName.iconsColor),
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

  SvgPicture iconBookMark() {
    return SvgPicture.asset(
      Assets.icons.bookMark,
      color: ColorName.primaryColor,
    );
  }

  Column nameAndLocation(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          namePlace,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
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
        ),
      ],
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
          image: AssetImage(image),
        ),
      ),
    );
  }
}
