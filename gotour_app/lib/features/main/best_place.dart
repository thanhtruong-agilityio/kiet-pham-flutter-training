import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/location.dart';
import 'package:gotour_app/core/widgets/title_and_button.dart';
import 'package:gotour_app/features/main/bloc/main_bloc.dart';
import 'package:gotour_app/features/main/models/model_hot_place.dart';

class GTBestPlace extends StatelessWidget {
  const GTBestPlace({
    super.key,
    required this.pressCard,
    required this.pressBtn,
    required this.pressBtnPrice,
  });

  final VoidCallback pressCard;
  final VoidCallback pressBtn;
  final VoidCallback pressBtnPrice;

  @override
  Widget build(BuildContext context) {
    var data = <HotPlace>[];

    final size = MediaQuery.of(context).size;
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainLoadedState) {
          data = state.listBestPlace;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 20),
                margin: const EdgeInsets.only(bottom: 14),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GTTitleAndSeeAllBtn(
                    title: S.of(context).mainPageBestPlace,
                    onPress: pressBtn,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 180,
                    width: size.width,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: GTCardBestPlace(
                          image: data[index].imageUrl,
                          placeName: data[index].placeName,
                          location: data[index].location,
                          price: data[index].price,
                          pressCard: pressCard,
                          pressBtnPrice: pressBtnPrice,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        }
        return Container();
      },
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
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: pressCard,
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                        colorIcon: ColorName.backgroundColor,
                        colorLocation: ColorName.backgroundColor,
                        colorName: ColorName.backgroundColor,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 25,
                    child: GTButton.highlight(
                      text: '\$$price',
                      onPress: pressBtnPrice,
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
