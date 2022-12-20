import 'package:flutter/material.dart';

class ShapeAnimation extends StatefulWidget {
  const ShapeAnimation({super.key});

  @override
  State<ShapeAnimation> createState() => _ShapeAnimationState();
}

class _ShapeAnimationState extends State<ShapeAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  double pos = 0;
  AnimationController? controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 200).animate(controller!)
      ..addListener(() {
        moveBall();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Controller"),
        actions: [
          IconButton(
            onPressed: () {
              controller!.reset();
              controller!.forward();
            },
            icon: Icon(Icons.run_circle),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(left: pos, top: pos, child: Ball()),
        ],
      ),
    );
  }

  void moveBall() {
    setState(() {
      pos = animation!.value;
    });
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
    );
  }
}
