import 'package:flutter/material.dart';

import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTGridViewHotPlace extends StatelessWidget {
  const GTGridViewHotPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GTText.TitleMedium(context, 'Hot Place'),
            ),
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> dataImages = [
      Assets.images.kyoto.path,
      Assets.images.chumphon.path,
      Assets.images.tibidabo.path,
      Assets.images.krabi.path,
      Assets.images.phranang.path,
      Assets.images.doipui.path,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: dataImages.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            print('tap item: $index');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: ColorName.primaryColor,
              image: DecorationImage(
                image: AssetImage(
                  dataImages[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
