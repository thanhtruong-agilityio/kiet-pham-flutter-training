import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_app/features/home/bloc/home_bloc.dart';
import 'package:gotour_app/features/home/models/best_place.dart';
import 'package:gotour_app/features/home/repository/home_repository.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/location.dart';
import 'package:gotour_ui/core/widgets/text.dart';
import 'package:gotour_ui/core/widgets/title.dart';

class GTBestPlace extends StatelessWidget {
  const GTBestPlace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = <BestPlace>[];

    final device = GTReponsive.of(context);
    return RepositoryProvider(
      create: (context) => HomeRepository(),
      child: BlocProvider(
        create: (context) => HomeBloc(
          mainRepository: RepositoryProvider.of<HomeRepository>(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(right: device.scale(20)),
              margin: EdgeInsets.only(bottom: device.scale(14)),
              child: Padding(
                padding: EdgeInsets.only(left: device.scale(20)),
                child: GTTitle(
                  title: S.of(context).mainPageBestPlace,
                  onPressed: () => context.goNamed('best-place'),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: device.scale(180),
                  width: device.scale(375),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeInitialState) {
                        context.read<HomeBloc>().add(BestPlaceFetchDataEvent());
                      }
                      if (state is BestPlaceLoadingState) {
                        return Center(
                          child: GTText.bodyLarge(context, text: 'Loading'),
                        );
                      }
                      if (state is BestPlaceLoadedState) {
                        data = state.listBestPlace;
                        return ListView.builder(
                          padding: EdgeInsets.only(left: device.scale(20)),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(right: device.scale(20)),
                            child: GTCardBestPlace(
                              image: data[index].imageUrl,
                              placeName: data[index].placeName,
                              location: data[index].location,
                              price: data[index].price,
                              pressCard: () => context.goNamed(
                                'hot-place',
                                params: {'id': data[index].id},
                              ),
                              pressBtnPrice: () {},
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GTCardBestPlace extends StatelessWidget {
  const GTCardBestPlace({
    super.key,
    required this.image,
    required this.placeName,
    required this.location,
    required this.price,
    required this.pressCard,
    required this.pressBtnPrice,
  });

  final VoidCallback pressCard;
  final VoidCallback pressBtnPrice;
  final String image;
  final String placeName;
  final String location;
  final String price;

  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: pressCard,
      child: Container(
        width: device.scale(295),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: device.scale(20),
            horizontal: device.scale(15),
          ),
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
                      GTLocation(
                        placeName: placeName,
                        location: location,
                        colorIcon: colorScheme.background,
                        colorLocation: colorScheme.background,
                        colorName: colorScheme.background,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: device.scale(25),
                    child: GTElevatedHighlightButton(
                      text: '\$$price',
                      onPressed: pressBtnPrice,
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
