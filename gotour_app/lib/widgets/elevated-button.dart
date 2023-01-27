import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

class GTElevatedButton extends StatelessWidget {
  GTElevatedButton({
    super.key,
    required this.shadowColor,
    this.activeIcon = false,
    this.icon,
    required this.text,
  });
  final Color shadowColor;
  final String? icon;
  final String text;
  bool activeIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 11,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        onPressed: () {},
        child: activeIcon == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon!,
                    height: 20,
                    width: 26,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorName.backgroundColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorName.backgroundColor,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
      ),
    );
  }
}
