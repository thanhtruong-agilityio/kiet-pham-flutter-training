import 'package:flutter/material.dart';
import 'package:gotour_ui/core/theme/theme.dart';
import 'package:gotour_widgetbook/core/widgets_component/bottom_navigation_bar.dart';
import 'package:gotour_widgetbook/core/widgets_component/button.dart';
import 'package:gotour_widgetbook/core/widgets_component/color.dart';
import 'package:gotour_widgetbook/core/widgets_component/text.dart';
import 'package:gotour_widgetbook/core/widgets_component/textfield.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatefulWidget {
  const WidgetbookHotReload({super.key});

  @override
  State<WidgetbookHotReload> createState() => _WidgetbookHotReloadState();
}

class _WidgetbookHotReloadState extends State<WidgetbookHotReload> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Widgetbook.material(
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
          widgets: [
            WidgetbookComponent(
              name: 'GTButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'All buttons',
                  builder: (context) =>
                      GTWBBuildButton(colorScheme: colorScheme),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'GTTextField',
              useCases: [
                WidgetbookUseCase(
                  name: 'TextField',
                  builder: (context) => const GTWBBuildTextField(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'GTText',
              useCases: [
                WidgetbookUseCase(
                  name: 'GTText',
                  builder: (context) => const GTWBBuildText(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'GTScaffold',
              useCases: [
                WidgetbookUseCase(
                  name: 'Bottom Navigation Bar',
                  builder: (context) => const WBBottomNavigationBar(),
                )
              ],
            ),
            WidgetbookComponent(
              name: 'GTColor',
              useCases: [
                WidgetbookUseCase(
                  name: 'Color',
                  builder: (context) => const WBColor(),
                ),
              ],
            )
          ],
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
    const WidgetbookHotReload(),
  );
}
