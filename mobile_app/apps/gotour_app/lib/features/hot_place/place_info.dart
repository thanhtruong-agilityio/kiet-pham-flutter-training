import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/location.dart';
import 'package:gotour_ui/core/widgets/tag.dart';

class GTPlaceInfoHotPlace extends StatefulWidget {
  const GTPlaceInfoHotPlace({
    super.key,
    required this.image,
    required this.placeName,
    required this.location,
    required this.price,
    required this.pressCard,
    required this.pressBtn,
    required this.tagList,
    required this.isBookmark,
    required this.onBookmark,
  });

  final VoidCallback pressCard;
  final VoidCallback pressBtn;
  final String image;
  final String placeName;
  final String location;
  final String price;
  final List<String> tagList;
  final bool isBookmark;
  final VoidCallback onBookmark;

  @override
  State<GTPlaceInfoHotPlace> createState() => _GTPlaceInfoHotPlaceState();
}

class _GTPlaceInfoHotPlaceState extends State<GTPlaceInfoHotPlace> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);
    final dataTags = widget.tagList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.pressCard,
          child: Stack(
            children: [
              Container(
                height: device.scale(200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: device.scale(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: widget.onBookmark,
                            child: SvgPicture.asset(
                              GTAssets().icBookMark,
                              color: widget.isBookmark
                                  ? colorScheme.primary
                                  : colorScheme.background,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: device.scale(28),
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
                  colorLocation: colorScheme.tertiary,
                  colorIcon: colorScheme.primary,
                ),
                SizedBox(
                  height: device.scale(15),
                ),
                Row(
                  children: List.generate(
                    dataTags.length,
                    (index) => Container(
                      margin: EdgeInsets.only(right: device.scale(12)),
                      child: GTTag(text: dataTags[index]),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
              child: GTElevatedHighlightButton(
                text: '\$${widget.price}',
                onPressed: widget.pressBtn,
              ),
            )
          ],
        )
      ],
    );
  }
}
