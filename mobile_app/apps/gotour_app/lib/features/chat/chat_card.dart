import 'package:flutter/material.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final device = GTResponsive.of(context);
    final i10n = S.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.only(
        left: device.scale(20),
        right: device.scale(20),
        top: device.scale(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GTLocalImage(
                  image: GTAssets.canyon,
                  width: device.scale(44),
                  height: device.scale(44),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: device.scale(15)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GTText.titleSmall(
                            context,
                            text: i10n.chatPageTitleMessage,
                          ),
                          const Spacer(),
                          GTText.bodySmall(
                            context,
                            text: i10n.chatPageDay,
                            color: colorScheme.tertiary,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          GTText.bodySmall(
                            context,
                            text: i10n.chatPageContent,
                            color: colorScheme.tertiary,
                          ),
                          const Spacer(),
                          GTText.bodySmall(
                            context,
                            text: i10n.chatPageTime,
                            color: colorScheme.tertiary,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: device.scale(10)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                width: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
