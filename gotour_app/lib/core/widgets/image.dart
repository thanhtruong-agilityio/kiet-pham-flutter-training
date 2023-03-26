import 'package:flutter/material.dart';

class GTImage extends StatelessWidget {
  const GTImage({
    super.key,
    required this.images,
    required this.height,
    required this.width,
  });

  final String images;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(images),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
