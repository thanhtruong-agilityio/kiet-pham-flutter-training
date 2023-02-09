import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/button.dart';

import 'card-image-with-bookmark.dart';
import 'tag.dart';
import 'title-with-location.dart';

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
  final Function pressCard, pressBtn;
  final String image, placeName, location, price;

  @override
  State<GTPlaceInfoHotPlace> createState() => _GTPlaceInfoHotPlaceState();
}

class _GTPlaceInfoHotPlaceState extends State<GTPlaceInfoHotPlace> {
  List<String> dataTags = ['7 day', 'summer'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                GTTitleWithLocation(
                    placeName: widget.placeName, location: widget.location),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: List.generate(
                    dataTags.length,
                    (index) => Container(
                      margin: EdgeInsets.only(right: 12),
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
