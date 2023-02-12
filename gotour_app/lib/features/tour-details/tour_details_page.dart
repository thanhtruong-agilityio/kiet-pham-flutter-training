import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/app_bar.dart';
import 'package:gotour_app/core/widgets/place_info_tour_details.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';
import 'package:gotour_app/core/widgets/service.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTTourDetails extends StatelessWidget {
  const GTTourDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GTScaffold(
      appBar: GTAppBar.inPage(
        onPressLeading: () => context.go('/main-page'),
        onPressNotification: () {},
        onPressMore: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 44),
              child: GTPlaceInfoTourDetails(
                namePlace: 'Capital of Thailand',
                location: 'Bangkok, Thailand',
                price: '3 000',
                temperature: '30°C',
                onPressCard: () {},
                onPressBtn: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 26, left: 20, right: 20),
              child: GTService(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26, left: 20, right: 20),
              child: GTText.bodyMedium(
                context,
                'Bangkok, Thailand’s capital, is a large city known for ornate shrines and vibrant street life. The boat-filled Chao Phraya River feeds its network of canals, flowing past the Rattanakosin royal district, home to opulent Grand Palace and its sacred Wat Phra Kaew Temple. earby is Wat Pho Temple with an enormous reclining Buddha and, on the opposite shore.',
                color: ColorName.secondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
