import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/widgets/app_bar.dart';
import 'package:gotour_app/core/widgets/gridview_hot_place.dart';
import 'package:gotour_app/core/widgets/place_info_hot_place.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';

class GTHotPlace extends StatelessWidget {
  const GTHotPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return GTScaffold(
      appBar: GTAppBar.inPage(
        onPressLeading: () => context.go('/main-page'),
        onPressNotification: () {},
        onPressMore: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 44),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 27),
              child: GTPlaceInfoHotPlace(
                image: Assets.images.tibidabo.path,
                placeName: 'Capital of Thailand',
                location: 'Bangkok, Thailand',
                price: '5 000',
                pressCard: () {},
                pressBtn: () {},
              ),
            ),
            const Expanded(child: GTGridViewHotPlace())
          ],
        ),
      ),
    );
  }
}
