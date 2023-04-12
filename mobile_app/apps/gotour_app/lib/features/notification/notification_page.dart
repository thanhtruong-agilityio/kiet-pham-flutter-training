import 'package:flutter/material.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/image.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTNotificationPage extends StatelessWidget {
  const GTNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GTScaffold(
      appBar: GTAppBar(
        title: GTText.titleLarge(
          context,
          text: S.of(context).notificationPageNotifications,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) =>
                  _NotificationsCard(colorScheme: colorScheme),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationsCard extends StatelessWidget {
  const _NotificationsCard({
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final i10n = S.of(context);
    final device = GTReponsive.of(context);

    return Container(
      height: 100,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: Card(
        elevation: 1,
        color: colorScheme.surface,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GTLocalImage(
                      image: GTAssets.canyon,
                      width: device.scale(44),
                      height: device.scale(44),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GTText.titleSmall(
                              context,
                              text: i10n.notificationPageBookmarked,
                            ),
                            const Spacer(),
                            GTText.bodySmall(
                              context,
                              text: i10n.notificationPageDay,
                              color: colorScheme.tertiary,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: 180,
                              child: GTText.bodySmall(
                                context,
                                text: i10n.notificationPageMessage,
                                maxLines: 2,
                                color: colorScheme.tertiary,
                              ),
                            ),
                            const Spacer(),
                            GTText.bodySmall(
                              context,
                              text: i10n.notificationPageTime,
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
          ],
        ),
      ),
    );
  }
}
