import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_ui/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTGridViewHotPlace extends StatelessWidget {
  const GTGridViewHotPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GTText.titleMedium(context, text: S.of(context).hotPlacePage),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        const Expanded(
          child: BuildGridview(),
        ),
      ],
    );
  }
}

class BuildGridview extends StatelessWidget {
  const BuildGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dataImages = <String>[
      Assets.images.kyoto.path,
      Assets.images.chumphon.path,
      Assets.images.tibidabo.path,
      Assets.images.krabi.path,
      Assets.images.phranang.path,
      Assets.images.doipui.path,
    ];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: dataImages.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          context.goNamed('tour-details');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(
                dataImages[index],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
