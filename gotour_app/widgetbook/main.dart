import 'package:flutter/material.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/theme/theme.dart';
import 'package:gotour_app/core/widgets/bottom_navigation_bar.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/service.dart';
import 'package:gotour_app/core/widgets/textfield.dart';
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
                WidgetbookUseCase(
                  name: 'Forward Button Onboarding',
                  builder: (context) => GTButton.icon(
                    icon: Assets.icons.left,
                    iconColor: ColorName.backgroundColor,
                    onPress: () {},
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Next Button Onboarding',
                  builder: (context) => GTButton.icon(
                    icon: Assets.icons.right,
                    iconColor: ColorName.backgroundColor,
                    onPress: () {},
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Search Button',
                  builder: (context) => GTButton.icon(
                    icon: Assets.icons.search,
                    iconColor: ColorName.backgroundColor,
                    onPress: () {},
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Login With Google',
                  builder: (context) => GTButton.normal(
                    icon: Assets.icons.google,
                    text: 'Login With Google',
                    onPress: () {},
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Login Button',
                  builder: (context) => SizedBox(
                    height: 40,
                    child: GTButton.highlight(
                      text: 'Login',
                      activateShadow: true,
                      onPress: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Sign Up Button',
                  builder: (context) => SizedBox(
                    height: 40,
                    child: GTButton.highlight(
                      text: 'Sign Up',
                      activateShadow: true,
                      onPress: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Forgot Password Button',
                  builder: (context) => GTButton.textHighlight(
                    text: 'Forgot Password?',
                    onPress: () {},
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Sign Up Here Button',
                  builder: (context) => GTButton.textHighlight(
                    text: 'Sign Up Here',
                    onPress: () {},
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TextField',
              useCases: [
                WidgetbookUseCase(
                  name: 'TextField',
                  builder: (context) => const GTTextField(
                    hintText: 'Find your location...',
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Email TextField',
                  builder: (context) => const GTTextField(
                    activateLabel: true,
                    hintText: 'email@example.com',
                    title: 'Email',
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Password TextField',
                  builder: (context) => const GTTextField(
                    activateLabel: true,
                    hideText: true,
                    hintText: 'Password',
                    title: 'Password',
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Service Tour Details',
              useCases: [
                WidgetbookUseCase(
                  name: 'Bottom Navigation Bar',
                  builder: (context) => const GTService(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Navigation Bar',
              useCases: [
                WidgetbookUseCase(
                  name: 'Bottom Navigation Bar',
                  builder: (context) => const GTBottomNavigationBar(),
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
    const WidgetbookHotReload(),
  );
}
