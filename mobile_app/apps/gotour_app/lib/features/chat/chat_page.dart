import 'package:flutter/material.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/widgets/app_bar.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/scaffold.dart';
import 'package:gotour_ui/core/widgets/search.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTChatPage extends StatelessWidget {
  const GTChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);

    return GTScaffold(
      appBar: GTAppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: device.scale(16)),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(GTAssets().imgAvatarDefault),
                ),
              ),
            ),
          ),
        ),
        title: GTText.titleLarge(context, text: 'Chat'),
        actionButtons: [
          GTIconButton(
            icon: GTAssets().icNotification,
            btnColor: colorScheme.background,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: device.scale(44)),
          const GTSearch(),
          SizedBox(height: device.scale(20)),
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
    final device = GTReponsive.of(context);
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
                child: Image.asset(
                  GTAssets().canyon,
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: device.scale(15)),
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
