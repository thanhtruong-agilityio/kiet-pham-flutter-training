import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.email,
    this.userName = '',
  });

  final String? userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 80,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: device.scale(15)),
            child: ClipOval(
              child: GTImage(
                images: GTAssets.kyoto,
                height: device.scale(60),
                width: device.scale(60),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(
                left: device.scale(17),
                top: device.scale(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GTText.titleSmall(
                              context,
                              text: userName ?? '',
                            ),
                            GTText.bodyMedium(
                              context,
                              text: email,
                              color: colorScheme.tertiary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(GTAssets.icArrowNext),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
