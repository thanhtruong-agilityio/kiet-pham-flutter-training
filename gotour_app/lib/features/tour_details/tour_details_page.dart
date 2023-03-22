import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/app_bar.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/features/tour_details/place_info.dart';
import 'package:gotour_app/features/tour_details/service.dart';

class GTTourDetails extends StatelessWidget {
  const GTTourDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GTScaffold(
      appBar: GTAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GTIconButton(
            icon: Assets.icons.back,
            btnColor: colorScheme.background,
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
        actionButtons: [
          GTIconButton(
            icon: Assets.icons.notification,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
          GTIconButton(
            icon: Assets.icons.more,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 44),
            GTPlaceInfoTourDetails(
              namePlace: 'Capital of Thailand',
              location: 'Bangkok, Thailand',
              price: '3 000',
              temperature: '30',
              onPressCard: () {},
              onPressBtn: () {},
            ),
            const SizedBox(height: 26),
            const GTService(),
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GTText.bodyMedium(
                context,
                text:
                    '''Bangkok, Thailand's capital, is a large city known for ornate shrines and vibrant street life. The boat-filled Chao Phraya River feeds its network of canals, flowing past the Rattanakosin royal district, home to opulent Grand Palace and its sacred Wat Phra Kaew Temple. earby is Wat Pho Temple with an enormous reclining Buddha and, on the opposite shore.''',
                color: colorScheme.secondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
