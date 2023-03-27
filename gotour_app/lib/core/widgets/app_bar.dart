import 'package:flutter/material.dart';

class GTAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GTAppBar({
    super.key,
    this.leading,
    this.actionButtons,
    this.title,
  });

  final Widget? leading;
  final List<Widget>? actionButtons;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      actions: actionButtons,
      title: title,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 45);
}
