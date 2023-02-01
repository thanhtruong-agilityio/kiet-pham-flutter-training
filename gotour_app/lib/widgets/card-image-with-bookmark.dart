import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotour_app/gen/assets.gen.dart';
import 'package:gotour_app/gen/colors.gen.dart';
import 'package:gotour_app/widgets/details-tours.dart';

class GTCardImageWithBookmark extends StatelessWidget {
  const GTCardImageWithBookmark({
    Key? key,
    required this.size,
    required this.images,
  }) : super(key: key);

  final Size size;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 1 / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(images),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      Assets.icons.bookMark,
                      color: ColorName.backgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
