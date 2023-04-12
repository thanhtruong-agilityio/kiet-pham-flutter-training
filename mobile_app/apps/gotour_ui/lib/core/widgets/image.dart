import 'package:flutter/material.dart';

class GTNetWorkImage extends StatelessWidget {
  const GTNetWorkImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.borderRadius,
    this.child,
    this.fit,
  });

  final String image;
  final double width;
  final double height;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: fit ?? BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class GTLocalImage extends StatelessWidget {
  const GTLocalImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.borderRadius,
    this.child,
    this.fit,
  });

  final String image;
  final double width;
  final double height;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        image: DecorationImage(
          image: AssetImage(image),
          fit: fit ?? BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
