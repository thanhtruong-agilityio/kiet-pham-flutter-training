import 'package:flutter/material.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTGridViewHotPlace extends StatelessWidget {
  const GTGridViewHotPlace({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    final device = GTReponsive.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GTText.titleMedium(context, text: S.of(context).hotPlacePage),
          ],
        ),
        SizedBox(
          height: device.scale(14),
        ),
        Expanded(
          child: BuildGridview(
            imageList: imageList,
          ),
        ),
      ],
    );
  }
}

class BuildGridview extends StatelessWidget {
  const BuildGridview({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    final dataImages = imageList;
    final device = GTReponsive.of(context);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: device.scale(10),
        crossAxisSpacing: device.scale(10),
      ),
      itemCount: dataImages.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(
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
