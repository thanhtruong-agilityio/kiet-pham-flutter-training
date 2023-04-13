import 'package:flutter/material.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTGridViewHotPlace extends StatelessWidget {
  const GTGridViewHotPlace({
    super.key,
    this.imageList = const [],
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    final device = GTResponsive.of(context);

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
          child: BuildGridView(
            imageList: imageList,
          ),
        ),
      ],
    );
  }
}

class BuildGridView extends StatelessWidget {
  const BuildGridView({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    final dataImages = imageList;
    final device = GTResponsive.of(context);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: device.scale(10),
        crossAxisSpacing: device.scale(10),
      ),
      itemCount: dataImages.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: GTNetWorkImage(
          image: dataImages[index],
          width: device.scale(100),
          height: device.scale(100),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
