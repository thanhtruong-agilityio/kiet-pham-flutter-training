import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/location.dart';
import 'package:gotour_ui/core/widgets/tag.dart';

class GTPlaceInfoHotPlace extends StatefulWidget {
  const GTPlaceInfoHotPlace({
    super.key,
    required this.image,
    required this.placeName,
    required this.location,
    this.price = '',
    this.onCard,
    this.onPrice,
    this.tagList = const [],
    this.isBookmark = false,
    this.onBookmark,
  });

  final VoidCallback? onCard;
  final VoidCallback? onPrice;
  final String image;
  final String placeName;
  final String location;
  final String price;
  final List<String> tagList;
  final bool isBookmark;
  final VoidCallback? onBookmark;

  @override
  State<GTPlaceInfoHotPlace> createState() => _GTPlaceInfoHotPlaceState();
}

class _GTPlaceInfoHotPlaceState extends State<GTPlaceInfoHotPlace> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTResponsive.of(context);
    final dataTags = widget.tagList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.onCard,
          child: Stack(
            children: [
              GTNetWorkImage(
                image: widget.image,
                width: device.scale(335),
                height: device.scale(200),
                borderRadius: BorderRadius.circular(20),
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
                              GTAssets.icBookMark,
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
                onPressed: widget.onPrice ?? () {},
              ),
            )
          ],
        )
      ],
    );
  }
}
