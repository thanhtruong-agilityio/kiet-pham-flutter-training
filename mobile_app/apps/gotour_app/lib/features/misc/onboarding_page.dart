import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_app/core/shared/device_info.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:gotour_ui/core/widgets/text.dart';

class GTOnboardingScreen extends StatefulWidget {
  const GTOnboardingScreen({super.key});

  @override
  State<GTOnboardingScreen> createState() => _GTOnboardingScreenState();
}

class _GTOnboardingScreenState extends State<GTOnboardingScreen> {
  int _pageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: PageView.builder(
                itemCount: dataBoards.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingContent(
                  image: dataBoards[index].image,
                  title: dataBoards[index].title,
                  description: dataBoards[index].description,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: device.sw(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GTIconButton(
                      icon: GTAssets().left,
                      iconColor: colorScheme.background,
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease,
                        );
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        dataBoards.length,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: device.sw(5),
                          ),
                          child: DotIndicator(
                            isActivate: index == _pageIndex,
                          ),
                        ),
                      ),
                    ),
                    GTIconButton(
                      icon: GTAssets().right,
                      iconColor: colorScheme.background,
                      onPressed: () => _pageIndex == dataBoards.length - 1
                          ? context.go('/login-page')
                          : _pageController.nextPage(
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.ease,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActivate = false,
  });
  final bool isActivate;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActivate ? colorScheme.primary : colorScheme.tertiaryContainer,
      ),
    );
  }
}

class Onboard {
  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
  final String image;
  final String title;
  final String description;
}

final List<Onboard> dataBoards = <Onboard>[
  Onboard(
    image: GTAssets().onboardingfirst,
    title: 'Explore',
    description: 'Explore your favourite destination around the world.',
  ),
  Onboard(
    image: GTAssets().onboardingsecond,
    title: 'Easy Peasy',
    description: 'Make your travel experince very easy & peasy..',
  ),
  Onboard(
    image: GTAssets().onboardinglast,
    title: 'Enjoy Tour',
    description: 'Enjoy your favourite destination with your love one.',
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final device = GTReponsive.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: device.sw(375),
          height: device.sh(508),
          fit: BoxFit.fill,
        ),
        SizedBox(height: device.sh(15)),
        Padding(
          padding: EdgeInsets.only(left: device.sw(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GTText.displayMedium(context, text: title),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: device.sh(5),
              ),
              SizedBox(
                width: device.sw(268),
                child: GTText.labelLarge(
                  context,
                  text: description,
                  color: colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
