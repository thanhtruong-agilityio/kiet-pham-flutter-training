import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/location.dart';
import 'package:gotour_app/core/widgets/place_image.dart';
import 'package:gotour_app/core/widgets/tag.dart';

class GTPlaceInfoHotPlace extends StatefulWidget {
  const GTPlaceInfoHotPlace({
    super.key,
    required this.image,
    required this.placeName,
    required this.location,
    required this.price,
    required this.pressCard,
    required this.pressBtn,
  });
  final VoidCallback pressCard;
  final VoidCallback pressBtn;
  final String image;
  final String placeName;
  final String location;
  final String price;

  @override
  State<GTPlaceInfoHotPlace> createState() => _GTPlaceInfoHotPlaceState();
}

class _GTPlaceInfoHotPlaceState extends State<GTPlaceInfoHotPlace> {
  List<String> dataTags = ['7 day', 'summer'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GTCardImageWithBookmark(
          size: size,
          images: widget.image,
          press: widget.pressCard,
        ),
        const SizedBox(
          height: 28,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GTLocation(
                  placeName: widget.placeName,
                  location: widget.location,
                  colorLocation: ColorName.iconsColor,
                  colorIcon: ColorName.primaryColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: List.generate(
                    dataTags.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: GTTag(text: dataTags[index]),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
              child: GTButton.highlight(
                text: '\$${widget.price}',
                onPress: widget.pressBtn,
              ),
            )
          ],
        )
      ],
    );
  }
}
