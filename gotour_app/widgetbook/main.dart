import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      devices: const [
        Apple.iPhone13Mini,
        Samsung.s21ultra,
      ],
      appInfo: AppInfo(
        name: 'Gotour Widgetbook',
      ),
      categories: [
        WidgetbookCategory(
          name: 'Widgets',
          widgets: [],
        ),
      ],
      themes: [
        WidgetbookTheme(name: 'Light', data: ThemeData.light()),
        WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
      ],
    );
  }
}

void main() {
  runApp(
    WidgetbookHotReload(),
  );
}
