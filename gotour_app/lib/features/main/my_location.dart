import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/location.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/features/main/bloc/main_bloc.dart';
import 'package:gotour_app/features/main/models/my_location.dart';
import 'package:gotour_app/features/main/repository/main_repository.dart';

class GTMyLocation extends StatelessWidget {
  const GTMyLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = <MyLocation>[];
    final size = MediaQuery.of(context).size;
    return RepositoryProvider(
      create: (context) => MainRepository(),
      child: BlocProvider(
        create: (context) => MainBloc(
          mainRepository: RepositoryProvider.of<MainRepository>(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GTText.titleMedium(
                    context,
                    text: S.of(context).mainPageMyLocation,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 180,
              width: size.width,
              child: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  if (state is MainInitialState) {
                    context.read<MainBloc>().add(MyLocationFetchDataEvent());
                  }
                  if (state is MyLocationLoadingState) {
                    return Center(
                      child: GTText.bodyLarge(context, text: 'Loading'),
                    );
                  }
                  if (state is MyLocationLoadedState) {
                    data = state.listMyLocation;
                    if (state.listMyLocation.isEmpty) {
                      return Center(
                        child: GTText.labelLarge(
                          context,
                          text: ' My Location is empty',
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final tourId = data[index].id;
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: GTCardMyLocation(
                            press: () => context.goNamed(
                              'tour-details',
                              params: {'id': data[index].id},
                            ),
                            image: data[index].imageUrl,
                            placeName: data[index].placeName,
                            location: data[index].location,
                            descriptions: data[index].descriptions,
                            onBookMark: () {
                              context.read<MainBloc>().add(
                                    DeleteMyLocationEvent(
                                      tourId: tourId,
                                    ),
                                  );
                            },
                          ),
                        );
                      },
                    );
                  }
                  if (state is DeleteMyLocationLoadingState) {
                    return Center(
                      child: GTText.labelLarge(
                        context,
                        text: 'Loading',
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    );
                  }
                  if (state is DeleteMyLocationSuccessState) {
                    data = state.listMyLocation;
                    if (state.listMyLocation.isEmpty) {
                      return Center(
                        child: GTText.labelLarge(
                          context,
                          text: ' My Location is empty',
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final tourId = data[index].id;
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: GTCardMyLocation(
                            press: () => context.goNamed(
                              'tour-details',
                              params: {'id': data[index].id},
                            ),
                            image: data[index].imageUrl,
                            placeName: data[index].placeName,
                            location: data[index].location,
                            descriptions: data[index].descriptions,
                            onBookMark: () {
                              context.read<MainBloc>().add(
                                    DeleteMyLocationEvent(
                                      tourId: tourId,
                                    ),
                                  );
                            },
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: GTText.bodyLarge(context, text: 'Fail'),
                  );
                },
              ),
            )
          ],
        ),
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
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.press,
      child: Container(
        margin: const EdgeInsets.only(
          left: 5,
          top: 14,
        ),
        width: size.width * 0.75,
        height: 136,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.surface,
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
                  const SizedBox(height: 11),
                  Container(
                    padding: const EdgeInsets.only(right: 39),
                    child: GTText.bodyMedium(
                      context,
                      text: widget.descriptions,
                      maxLines: 3,
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
        Assets.icons.bookMark,
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
        color: Theme.of(context).colorScheme.primary,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.image),
        ),
      ),
    );
  }
}
