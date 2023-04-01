import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gotour_app/core/assets/assets.dart';
import 'package:gotour_ui/core/widgets/bottom_navigation_bar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final position = 0;
    final _currentIndex = 0;

    return Scaffold(
      body: widget.body,
      bottomNavigationBar: const GTBottomNavigationBar(),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (index) {},
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(GTAssets().options),
      //       activeIcon: SvgPicture.asset(
      //         GTAssets().options,
      //         color: colorScheme.primary,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(GTAssets().options),
      //       activeIcon: SvgPicture.asset(
      //         GTAssets().options,
      //         color: colorScheme.primary,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(GTAssets().options),
      //       activeIcon: SvgPicture.asset(
      //         GTAssets().options,
      //         color: colorScheme.primary,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(GTAssets().options),
      //       activeIcon: SvgPicture.asset(
      //         GTAssets().options,
      //         color: colorScheme.primary,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: SvgPicture.asset(GTAssets().options),
      //       activeIcon: SvgPicture.asset(
      //         GTAssets().options,
      //         color: colorScheme.primary,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  // void _onTap(int index) {
  //   switch (index) {
  //     case 0:
  //       context.go('/home-page');
  //       break;
  //     case 1:
  //       context.go('/notifications');
  //       break;
  //     case 2:
  //       context.go('/chat');
  //       break;
  //     case 3:
  //       context.go('/location');
  //       break;
  //     case 4:
  //       context.go('/profile');
  //       break;
  //   }
  // }
}

// BottomNavigationBar(
//         currentIndex: position,
//         onTap: _onTap,
//         items: [
//           BottomNavigationBarItem(
//             activeIcon: SvgPicture.asset(
//               GTAssets().options,
//               color: colorScheme.primary,
//             ),
//             icon: SvgPicture.asset(GTAssets().options),
//           ),
//           BottomNavigationBarItem(
//             activeIcon: SvgPicture.asset(
//               GTAssets().bell,
//               color: colorScheme.primary,
//             ),
//             icon: SvgPicture.asset(GTAssets().bell),
//           ),
//           BottomNavigationBarItem(
//             activeIcon: SvgPicture.asset(
//               GTAssets().message,
//               color: colorScheme.primary,
//             ),
//             icon: SvgPicture.asset(GTAssets().message),
//           ),
//           BottomNavigationBarItem(
//             activeIcon: SvgPicture.asset(
//               GTAssets().location,
//               color: colorScheme.primary,
//             ),
//             icon: SvgPicture.asset(GTAssets().location),
//           ),
//           BottomNavigationBarItem(
//             activeIcon: SvgPicture.asset(
//               GTAssets().person,
//               color: colorScheme.primary,
//             ),
//             icon: SvgPicture.asset(GTAssets().person),
//           ),
//         ],
//       ),
//     )
