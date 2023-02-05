import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/theme/theme.dart';
import 'package:gotour_app/widgets/bottom-navigation-bar.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({super.key});

  @override
  Widget build(BuildContext context) {
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
              name: 'Button',
              useCases: [
                // WidgetbookUseCase(
                //   name: 'Forward Button Onboarding',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.left,
                //     iconColor: ColorName.backgroundColor,
                //     btnColor: ColorName.primaryColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     paddingRight: 2,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Next Button Onboarding',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.right,
                //     iconColor: ColorName.backgroundColor,
                //     btnColor: ColorName.primaryColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     paddingLeft: 2,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Search Button',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.search,
                //     iconColor: ColorName.backgroundColor,
                //     btnColor: ColorName.primaryColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Sun Button - Activated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.sun,
                //     iconColor: ColorName.backgroundColor,
                //     btnColor: ColorName.primaryColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Sun Button - UnActivated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.sun,
                //     iconColor: ColorName.iconsColor,
                //     btnColor: ColorName.surfaceColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Air Button - Activated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.air,
                //     iconColor: ColorName.backgroundColor,
                //     btnColor: ColorName.primaryColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Air Button - UnActivated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.air,
                //     iconColor: ColorName.iconsColor,
                //     btnColor: ColorName.surfaceColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Boat Button - Activated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.boat,
                //     iconColor: ColorName.backgroundColor,
                //     btnColor: ColorName.primaryColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Boat Button - UnActivated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.boat,
                //     iconColor: ColorName.iconsColor,
                //     btnColor: ColorName.surfaceColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Car Button - Activated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.car,
                //     iconColor: ColorName.backgroundColor,
                //     btnColor: ColorName.primaryColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Car Button - UnActivated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.car,
                //     iconColor: ColorName.iconsColor,
                //     btnColor: ColorName.surfaceColor,
                //     iconWidth: 20,
                //     iconHeight: 20,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Moto Button - Activated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.moto,
                //     iconColor: ColorName.backgroundColor,
                //     btnColor: ColorName.primaryColor,
                //     iconWidth: 30,
                //     iconHeight: 15,
                //     press: () {},
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Moto Button - UnActivated',
                //   builder: (context) => GTIconBtn(
                //     icon: Assets.icons.moto,
                //     iconColor: ColorName.iconsColor,
                //     btnColor: ColorName.surfaceColor,
                //     iconWidth: 30,
                //     iconHeight: 15,
                //     press: () {},
                //   ),
                // ),
              ],
            ),
            WidgetbookComponent(
              name: 'Navigation Bar',
              useCases: [
                WidgetbookUseCase(
                  name: 'Bottom Navigation Bar',
                  builder: (context) => GTBottomNavigationBar(),
                ),
              ],
            ),
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
    WidgetbookHotReload(),
  );
}
