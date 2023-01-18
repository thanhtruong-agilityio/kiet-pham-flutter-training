import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gotour_app/theme/theme.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      devices: const [
        // iOS
        Apple.iPhone8,
        Apple.iPhone8Plus,

        Apple.iPhone11,
        Apple.iPhone11Pro,
        Apple.iPhone11ProMax,

        Apple.iPhone12,
        Apple.iPhone12Pro,
        Apple.iPhone12ProMax,

        Apple.iPhone13Mini,
        Apple.iPhone13,
        Apple.iPhone13Pro,
        Apple.iPhone13ProMax,

        // Android
        Samsung.s10,
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
        WidgetbookTheme(name: 'Light', data: GTTheme.lightTheme),
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
