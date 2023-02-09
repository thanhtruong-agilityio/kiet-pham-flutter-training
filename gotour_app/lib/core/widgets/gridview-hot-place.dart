import 'package:flutter/material.dart';

import 'text.dart';

class GTGridViewHotPlace extends StatelessWidget {
  const GTGridViewHotPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GTText.TitleMedium(context, 'Hot Place'),
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
      'assets/images/Kyoto.png',
      'assets/images/ChumPhon.png',
      'assets/images/Tibidabo.png',
      'assets/images/Krabi.png',
      'assets/images/PhraNang.png',
      'assets/images/DoiPui.png',
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
    );
  }
}
