import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_generated/assets.gen.dart';
import '../resources/assets_generated/colors.gen.dart';
import 'button.dart';

class GTAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GTAppBar({
    super.key,
    this.title,
    required this.onPressLeading,
  });

  final String? title;
  final Function onPressLeading;

  const factory GTAppBar.inMain({
    required String avatar,
    required Function onPressLeading,
    required Function onPressAvatar,
  }) = _GTAppBarWithAvatar;

  const factory GTAppBar.inPage({
    required Function onPressLeading,
    required Function onPressNotification,
    required Function onPressMore,
  }) = _GTAppBarInPage;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(double.infinity, 45);
}

class _GTAppBarWithAvatar extends GTAppBar {
  const _GTAppBarWithAvatar({
    required this.avatar,
    required super.onPressLeading,
    required this.onPressAvatar,
  });

  final String avatar;
  final Function onPressAvatar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          GTButton.icon(
            icon: Assets.icons.menu,
            btnColor: ColorName.backgroundColor,
            onPress: onPressLeading,
          ),
          const Spacer(),
          InkWell(
            onTap: onPressAvatar as Function(),
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
    );
  }
}

class _GTAppBarInPage extends GTAppBar {
  const _GTAppBarInPage({
    required super.onPressLeading,
    required this.onPressNotification,
    required this.onPressMore,
  });

  final Function onPressNotification, onPressMore;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GTButton.icon(
        icon: Assets.icons.back,
        btnColor: ColorName.backgroundColor,
        onPress: onPressLeading,
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
