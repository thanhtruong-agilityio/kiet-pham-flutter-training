import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/theme/theme.dart';
import 'package:gotour_app/core/widgets/button.dart';
import 'package:gotour_app/core/widgets/scaffold.dart';
import 'package:gotour_app/core/widgets/text.dart';
import 'package:gotour_app/core/widgets/textfield.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatefulWidget {
  const WidgetbookHotReload({super.key});

  @override
  State<WidgetbookHotReload> createState() => _WidgetbookHotReloadState();
}

class _WidgetbookHotReloadState extends State<WidgetbookHotReload> {
  @override
  Widget build(BuildContext context) {
    final icons = <Option<String>>[
      Option(
        label: 'back',
        value: Assets.icons.back,
      ),
      Option(
        label: 'bell',
        value: Assets.icons.bell,
      ),
      Option(
        label: 'boat',
        value: Assets.icons.boat,
      ),
      Option(
        label: 'bookMark',
        value: Assets.icons.bookMark,
      ),
      Option(
        label: 'car',
        value: Assets.icons.car,
      ),
      Option(
        label: 'checkmark',
        value: Assets.icons.checkmark,
      ),
      Option(
        label: 'cloud',
        value: Assets.icons.cloud,
      ),
      Option(
        label: 'google',
        value: Assets.icons.google,
      ),
    ];
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
                  builder: (context) => SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CodeView(
                            title: 'Button Icon',
                            code: '''
GTButton.icon(
  icon: icon,
  iconColor: color,
  onPress: () {},
)
''',
                          ),
                          const SizedBox(height: 10),
                          GTIconButton(
                            icon: context.knobs.options(
                              label: 'Icon',
                              options: icons,
                            ),
                            iconColor: ColorName.backgroundColor,
                            onPress: () {},
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: 'Button Normal',
                            code: '''
GTButton.normal(
  icon: icon,
  text: text,
  onPress: () {},
)
''',
                          ),
                          const SizedBox(height: 10),
                          GTElevatedButton(
                            icon: context.knobs
                                .options(label: 'Icon', options: icons),
                            text: context.knobs.text(label: 'Text'),
                            onPressed: () {},
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: 'Button Highlight',
                            code: '''
GTButton.highlight(
  text: text,
  activateShadow: true
  onPress: () {},
)
''',
                          ),
                          const SizedBox(height: 10),
                          GTButton.highlight(
                            text: context.knobs.text(
                              label: 'Text',
                              initialValue: 'Sign Up',
                            ),
                            activateShadow: context.knobs.boolean(
                              label: 'activateShadow',
                              initialValue: true,
                            ),
                            onPress: () {},
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: 'Button Text',
                            code: '''
GTButton.text(
  text: text,
  onPress: () {},
)
''',
                          ),
                          const SizedBox(height: 10),
                          GTTextButton(
                            text: context.knobs.text(
                              label: 'Text',
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(height: 40),
                          const CodeView(
                            title: 'Button Text Highlight',
                            code: '''
GTButton.text(
  text: text,
  onPress: () {},
)
''',
                          ),
                          const SizedBox(height: 10),
                          GTTextHighlightButton(
                            text: context.knobs.text(
                              label: 'Text',
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'GTTextField',
              useCases: [
                WidgetbookUseCase(
                  name: 'TextField',
                  builder: (context) => GTTextField(
                    title: context.knobs.text(
                      label: 'title',
                    ),
                    hintText: context.knobs.text(
                      label: 'hintText',
                      initialValue: 'input value',
                    ),
                    activateLabel: context.knobs.boolean(
                      label: 'activateLabel',
                    ),
                    obscureText: context.knobs.boolean(
                      label: 'obscureText',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'GTText',
              useCases: [
                WidgetbookUseCase(
                  name: 'GTText.bodySmall()',
                  builder: (context) => Center(
                    child: GTText.bodySmall(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.bodyMedium()',
                  builder: (context) => Center(
                    child: GTText.bodyMedium(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.bodyLarge()',
                  builder: (context) => Center(
                    child: GTText.bodyLarge(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.labelSmall()',
                  builder: (context) => Center(
                    child: GTText.labelSmall(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.labelMedium()',
                  builder: (context) => Center(
                    child: GTText.labelMedium(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.labelLarge()',
                  builder: (context) => Center(
                    child: GTText.labelLarge(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.titleSmall()',
                  builder: (context) => Center(
                    child: GTText.titleSmall(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.titleMedium()',
                  builder: (context) => Center(
                    child: GTText.titleMedium(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.titleLarge()',
                  builder: (context) => Center(
                    child: GTText.titleLarge(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.displaySmall()',
                  builder: (context) => Center(
                    child: GTText.displaySmall(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'GTText.displayMedium()',
                  builder: (context) => Center(
                    child: GTText.displayMedium(
                      context,
                      text: context.knobs.text(
                        label: 'label',
                        initialValue: 'input label',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'GTScaffold',
              useCases: [
                WidgetbookUseCase(
                  name: 'Bottom Navigation Bar',
                  builder: (context) => GTScaffold(
                    appBar: AppBar(),
                    body: Container(),
                  ),
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

class CodeView extends StatefulWidget {
  const CodeView({
    super.key,
    required this.title,
    required this.code,
  });

  final String code;
  final String title;

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GTText.titleSmall(
              context,
              text: widget.title,
            ),
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return GTTextButton(
                  text: _isVisible ? 'hide code' : 'show code',
                  onPressed: _toggleVisibility,
                );
              },
            ),
          ],
        ),
        Visibility(
          visible: _isVisible,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GTText.bodyLarge(context, text: widget.code),
              const Spacer(),
              CopyButton(text: widget.code),
            ],
          ),
        ),
      ],
    );
  }
}

class CopyButton extends StatelessWidget {
  const CopyButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return GTTextButton(
      text: 'Copy',
      onPressed: () {
        Clipboard.setData(ClipboardData(text: text));
        const snackBar = SnackBar(content: Text('Copied to clipboard'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
