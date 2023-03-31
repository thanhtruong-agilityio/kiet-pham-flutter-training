import 'package:flutter/material.dart';
import 'package:gotour_ui/core/resources/assets_generated/colors.gen.dart';

class ColorInfo {
  const ColorInfo({
    required this.color,
    required this.hex,
    required this.name,
  });
  final Color color;
  final String hex;
  final String name;
}

final whiteToBlack = <ColorInfo>[
  const ColorInfo(
    color: ColorName.backgroundColor,
    hex: '#FFFFFF',
    name: 'background',
  ),
  const ColorInfo(
    color: ColorName.surfaceColor,
    hex: '#F8F8F8',
    name: 'surfaceColor',
  ),
  const ColorInfo(
    color: ColorName.onSecondaryContainerColor,
    hex: '#CCCCCC',
    name: 'onSecondaryContainerColor',
  ),
  const ColorInfo(
    color: ColorName.tertiaryContainerColor,
    hex: '#C4C4C4',
    name: 'tertiaryContainerColor',
  ),
  const ColorInfo(
    color: ColorName.tertiaryColor,
    hex: '#AAAAAA',
    name: 'tertiaryColor',
  ),
  const ColorInfo(
    color: ColorName.secondaryColor,
    hex: '#888888',
    name: 'secondaryColor',
  ),
  const ColorInfo(
    color: ColorName.surfaceTintColor,
    hex: '#666666',
    name: 'surfaceTintColor',
  ),
  const ColorInfo(
    color: ColorName.outlineColor,
    hex: '#333333',
    name: 'outlineColor',
  ),
  const ColorInfo(
    color: ColorName.onBackgroundColor,
    hex: '000000',
    name: 'onBackgroundColor',
  ),
];

final primaryColor = <ColorInfo>[
  const ColorInfo(
    color: ColorName.primaryColor,
    hex: '#FF7D0D',
    name: 'primary',
  ),
  const ColorInfo(
    color: ColorName.onPrimaryColor,
    hex: 'FFFFFF',
    name: 'onPrimary',
  )
];

final errorColor = <ColorInfo>[
  const ColorInfo(
    color: ColorName.errorColor,
    hex: '#FF0000',
    name: 'error',
  ),
  const ColorInfo(
    color: ColorName.onErrorColor,
    hex: '#FFFFFF',
    name: 'onErrorColor',
  ),
];
