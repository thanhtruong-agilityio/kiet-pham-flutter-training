import 'package:flutter/material.dart';
import 'package:mobile_app/core/resources/assets_generated/assets.gen.dart';
import 'package:mobile_app/core/widgets/app_bar.dart';
import 'package:mobile_app/core/widgets/scaffold.dart';
import 'package:mobile_app/core/widgets/text.dart';

class GTNotificationPage extends StatelessWidget {
  const GTNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GTScaffold(
      appBar: GTAppBar(
        title: GTText.titleLarge(context, text: 'Notifications'),
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
                    child: Assets.images.canyon.image(
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
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
                              text: 'Bookmarked',
                            ),
                            const Spacer(),
                            GTText.bodySmall(
                              context,
                              text: '26/03 2023',
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
                                text:
                                    '''You have added da nang tour to your bookmarks list''',
                                maxLines: 2,
                                color: colorScheme.tertiary,
                              ),
                            ),
                            const Spacer(),
                            GTText.bodySmall(
                              context,
                              text: '16:53 PM',
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
