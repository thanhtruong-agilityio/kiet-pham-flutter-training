import 'package:flutter/material.dart';
import 'package:gotour_app/core/device_info.dart';
import 'package:gotour_app/features/chat/chat_card.dart';
import 'package:gotour_ui/core/assets.dart';
import 'package:gotour_ui/core/resources/l10n_generated/l10n.dart';
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
            // avatar
            child: Container(
              height: device.scale(48),
              width: device.scale(44),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(GTAssets.imgAvatarDefault),
                ),
              ),
            ),
          ),
        ),
        title: GTText.titleLarge(context, text: S.of(context).chatPageTitle),
        // notification button
        actionButtons: [
          GTIconButton(
            icon: GTAssets.icNotification,
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
          // chat list
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ChatCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
