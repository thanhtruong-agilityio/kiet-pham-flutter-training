import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

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
    return SafeArea(
      child: SizedBox(
        height: 44,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Material(
            color: ColorName.surfaceColor,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: List.generate(
                  data.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: SvgPicture.asset(
                      data[index],
                      height: 20,
                      width: 20,
                      color: index == selectedIndex
                          ? ColorName.primaryColor
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
