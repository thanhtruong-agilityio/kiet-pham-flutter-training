import 'package:flutter/material.dart';
import 'package:mobile_app/core/resources/assets_generated/assets.gen.dart';
import 'package:mobile_app/core/widgets/button.dart';

class GTBottomNavigationBar extends StatefulWidget {
  const GTBottomNavigationBar({super.key});

  @override
  State<GTBottomNavigationBar> createState() => _GTBottomNavigationBarState();
}

class _GTBottomNavigationBarState extends State<GTBottomNavigationBar> {
  int selectedIndex = 0;
  List<String> data = [
    Assets.icons.options,
    Assets.icons.bell,
    Assets.icons.message,
    Assets.icons.location,
    Assets.icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Material(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: List.generate(
                data.length,
                (index) => GTIconButton(
                  icon: data[index],
                  btnColor: colorScheme.surface,
                  iconColor:
                      index == selectedIndex ? colorScheme.primary : null,
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
