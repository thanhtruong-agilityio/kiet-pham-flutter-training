import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/router/named_location.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/features/home/bloc/home_bloc.dart';
import 'package:gotour_app/features/home/models/my_location.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/widgets/location.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTMyLocation extends StatelessWidget {
  const GTMyLocation({
    super.key,
    required this.mylocatonList,
  });

  final List<MyLocation> mylocatonList;

  @override
  Widget build(BuildContext context) {
    final data = mylocatonList;
    final device = GTReponsive.of(context);

    return SizedBox(
      height: device.scale(150),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final tourId = data[index].id;
          return Container(
            margin: const EdgeInsets.only(right: 20),
            child: GTCardMyLocation(
              press: () => context.pushNamed(
                RouterNamedLocation.tourDetails,
                params: {'id': data[index].id},
              ),
              image: data[index].imageUrl,
              placeName: data[index].placeName,
              location: data[index].location,
              descriptions: data[index].descriptions,
              onBookMark: () {
                context.read<HomeBloc>().add(
                      UnbookmarkTourEvent(
                        tourId: tourId,
                        index: index,
                      ),
                    );
              },
            ),
          );
        },
      ),
    );
  }
}

class GTCardMyLocation extends StatefulWidget {
  const GTCardMyLocation({
    super.key,
    required this.press,
    required this.image,
    required this.placeName,
    required this.location,
    required this.descriptions,
    required this.onBookMark,
  });

  final VoidCallback press;
  final String image;
  final String placeName;
  final String location;
  final String descriptions;
  final VoidCallback onBookMark;

  @override
  State<GTCardMyLocation> createState() => _GTCardMyLocationState();
}

class _GTCardMyLocationState extends State<GTCardMyLocation> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);

    return GestureDetector(
      onTap: widget.press,
      child: Container(
        margin: EdgeInsets.only(
          left: device.scale(5),
          top: device.scale(14),
        ),
        width: device.scale(295),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.surface,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: device.scale(15),
            right: device.scale(20),
          ),
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
                        padding: EdgeInsets.only(top: device.scale(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                imagePlace(),
                                SizedBox(width: device.scale(11)),
                                GTLocation(
                                  placeName: widget.placeName,
                                  location: widget.location,
                                  colorIcon: colorScheme.primary,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      iconBookMark()
                    ],
                  ),
                  SizedBox(height: device.scale(11)),
                  Container(
                    padding: EdgeInsets.only(right: device.scale(39)),
                    child: GTText.bodyMedium(
                      context,
                      text: widget.descriptions,
                      maxLines: 2,
                      color: colorScheme.tertiary,
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
      onTap: widget.onBookMark,
      child: SvgPicture.asset(
        GTAssets().icBookMark,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Container imagePlace() {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.image),
        ),
      ),
    );
  }
}

class GTMylocationShimmerList extends StatefulWidget {
  const GTMylocationShimmerList({super.key});

  @override
  State<GTMylocationShimmerList> createState() =>
      _GTMylocationShimmerListState();
}

class _GTMylocationShimmerListState extends State<GTMylocationShimmerList> {
  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);

    return SizedBox(
      height: device.scale(150),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return const _GTShimmerLayout();
        },
      ),
    );
  }
}

class _GTShimmerLayout extends StatelessWidget {
  const _GTShimmerLayout();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);
    return Container(
      margin: EdgeInsets.only(
        right: 20,
        left: device.scale(5),
        top: device.scale(14),
      ),
      width: device.scale(295),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorScheme.surface,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: device.scale(15),
          right: device.scale(20),
        ),
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
                      padding: EdgeInsets.only(top: device.scale(24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorScheme.onSecondaryContainer,
                                ),
                              ),
                              SizedBox(width: device.scale(11)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: colorScheme.onSecondaryContainer,
                                    ),
                                    height: device.scale(20),
                                    width: device.scale(139),
                                  ),
                                  SizedBox(
                                    height: device.scale(10),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: colorScheme.onSecondaryContainer,
                                    ),
                                    width: device.scale(120),
                                    height: device.scale(16),
                                    padding: EdgeInsets.only(
                                      left: device.scale(9),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // iconBookMark()
                  ],
                ),
                SizedBox(height: device.scale(11)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorScheme.onSecondaryContainer,
                  ),
                  height: device.scale(15),
                  width: device.scale(242),
                  padding: EdgeInsets.only(right: device.scale(39)),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorScheme.onSecondaryContainer,
                  ),
                  height: device.scale(15),
                  width: device.scale(242),
                  padding: EdgeInsets.only(right: device.scale(39)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
