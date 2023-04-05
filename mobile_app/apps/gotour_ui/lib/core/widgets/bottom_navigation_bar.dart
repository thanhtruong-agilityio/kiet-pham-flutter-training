import 'package:flutter/material.dart';
import 'package:gotour_ui/core/widgets/button.dart';
import 'package:go_router/go_router.dart';

class GTBottomNavigationBar extends StatefulWidget {
  const GTBottomNavigationBar({
    super.key,
    required this.routes,
    required this.icons,
  });

  final List<String> routes;
  final List<String> icons;

  @override
  State<GTBottomNavigationBar> createState() => _GTBottomNavigationBarState();
}

class _GTBottomNavigationBarState extends State<GTBottomNavigationBar> {
  int selectedIndex = 0;

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
                widget.icons.length,
                (index) => GTIconButton(
                  icon: widget.icons[index],
                  btnColor: colorScheme.surface,
                  iconColor:
                      index == selectedIndex ? colorScheme.primary : null,
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                      context.go(widget.routes[index]);
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
