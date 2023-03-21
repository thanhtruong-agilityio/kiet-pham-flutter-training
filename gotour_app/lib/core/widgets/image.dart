import 'package:flutter/material.dart';

class GTImage extends StatelessWidget {
  const GTImage({
    super.key,
    required this.images,
  });

  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(images),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
