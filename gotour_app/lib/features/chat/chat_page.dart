import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/widgets/app_bar.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';
import 'package:gotour_app/core/widgets/search.dart';
import 'package:gotour_app/core/widgets/text.dart';

class GTChatPage extends StatelessWidget {
  const GTChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GTScaffold(
      appBar: GTAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {},
            child: Assets.images.author.image(
              width: 48,
              height: 48,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: GTText.titleLarge(context, text: 'Chat'),
        actionButtons: [
          GTIconButton(
            icon: Assets.icons.notification,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 44),
          const GTSearch(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return _ChatCard(colorScheme: colorScheme);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatCard extends StatelessWidget {
  const _ChatCard({
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Assets.images.canyon.image(
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GTText.titleSmall(context, text: 'Kiet Pham'),
                          const Spacer(),
                          GTText.bodySmall(
                            context,
                            text: '26/03 2023',
                            color: colorScheme.tertiary,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          GTText.bodySmall(
                            context,
                            text: 'Welcome to gotour chat',
                            color: colorScheme.tertiary,
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
          const SizedBox(height: 10),
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
