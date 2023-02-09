import 'package:flutter/material.dart';

import 'package:gotour_app/core/resources/assets_generated/assets.gen.dart';
import 'package:gotour_app/core/resources/assets_generated/colors.gen.dart';
import 'package:gotour_app/core/widgets/text.dart';

import 'package:gotour_app/core/widgets/button.dart';
import 'package:go_router/go_router.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: data_boards.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingContent(
                  image: data_boards[index].image,
                  title: data_boards[index].title,
                  description: data_boards[index].description,
                ),
              ),
            ),
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GTButton.icon(
                    icon: Assets.icons.left,
                    iconColor: ColorName.backgroundColor,
                    onPress: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease,
                      );
                    },
                  ),
                  Row(
                    children: List.generate(
                      data_boards.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: DotIndicator(
                          isActivate: index == _pageIndex,
                        ),
                      ),
                    ),
                  ),
                  GTButton.icon(
                    icon: Assets.icons.right,
                    iconColor: ColorName.backgroundColor,
                    onPress: () => _pageIndex == data_boards.length - 1
                        ? context.go('/login-page')
                        : _pageController.nextPage(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.ease,
                          ),
                    // onPress: () => context.go('/homepage')
                  ),
                ],
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
    Key? key,
    this.isActivate = false,
  }) : super(key: key);
  final bool isActivate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActivate == true
            ? ColorName.primaryColor
            : ColorName.indicatorOnboarding,
      ),
    );
  }
}

class Onboard {
  final String image, title, description;
  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> data_boards = [
  Onboard(
    image: Assets.images.onboardingfirst.path,
    title: 'Explore',
    description: 'Explore your favourite destination around the world.',
  ),
  Onboard(
    image: Assets.images.onboardinglast.path,
    title: 'Easy Peasy',
    description: 'Make your travel experince very easy & peasy..',
  ),
  Onboard(
    image: Assets.images.onboardingsecond.path,
    title: 'Enjoy Tour',
    description: 'Enjoy your favourite destination with your love one.',
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GTText.displayMedium(context, title),
                  Spacer(),
                ],
              ),
              SizedBox(
                width: size.width * 2 / 3,
                child: GTText.labelLarge(
                  context,
                  description,
                  color: ColorName.iconsColor,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
