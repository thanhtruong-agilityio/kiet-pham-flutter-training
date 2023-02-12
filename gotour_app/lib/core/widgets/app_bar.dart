import 'package:flutter/material.dart';

import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/button.dart';

class GTAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GTAppBar({
    super.key,
    this.title,
    required this.onPressLeading,
  });

  const factory GTAppBar.inPage({
    required VoidCallback onPressLeading,
    required VoidCallback onPressNotification,
    required VoidCallback onPressMore,
  }) = _GTAppBarInPage;

  const factory GTAppBar.inMain({
    required String avatar,
    required VoidCallback onPressLeading,
    required VoidCallback onPressAvatar,
  }) = _GTAppBarWithAvatar;

  final String? title;
  final VoidCallback onPressLeading;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size(double.infinity, 45);
}

class _GTAppBarWithAvatar extends GTAppBar {
  const _GTAppBarWithAvatar({
    required this.avatar,
    required super.onPressLeading,
    required this.onPressAvatar,
  });

  final String avatar;
  final VoidCallback onPressAvatar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            GTButton.icon(
              icon: Assets.icons.menu,
              btnColor: ColorName.backgroundColor,
              onPress: onPressLeading,
            ),
            const Spacer(),
            InkWell(
              onTap: onPressAvatar,
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(avatar),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GTAppBarInPage extends GTAppBar {
  const _GTAppBarInPage({
    required super.onPressLeading,
    required this.onPressNotification,
    required this.onPressMore,
  });

  final VoidCallback onPressNotification;
  final VoidCallback onPressMore;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GTButton.icon(
          icon: Assets.icons.back,
          btnColor: ColorName.backgroundColor,
          onPress: onPressLeading,
        ),
      ),
      actions: [
        GTButton.icon(
          icon: Assets.icons.notification,
          btnColor: ColorName.backgroundColor,
          onPress: onPressNotification,
        ),
        GTButton.icon(
          icon: Assets.icons.more,
          btnColor: ColorName.backgroundColor,
          onPress: onPressMore,
        ),
      ],
    );
  }
}
