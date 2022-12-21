import 'package:flutter/material.dart';

class ShapeAnimation extends StatefulWidget {
  const ShapeAnimation({super.key});

  @override
  State<ShapeAnimation> createState() => _ShapeAnimationState();
}

class _ShapeAnimationState extends State<ShapeAnimation>
    with SingleTickerProviderStateMixin {
  double posTop = 0;
  double posLeft = 0;
  // Animation<double>? animationTop;
  // Animation<double>? animationLeft;
  AnimationController? controller;
  double maxTop = 0;
  double maxLeft = 0;
  Animation<double>? animation;
  final int ballSize = 100;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // animationLeft = Tween<double>(begin: 0, end: 200).animate(controller!);
    // animationTop = Tween<double>(begin: 0, end: 400).animate(controller!)
    //   ..addListener(() {
    //     moveBall();
    //   });

    animation = CurvedAnimation(
      parent: controller!,
      curve: Curves.easeInOut,
    );

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    animation!.addListener(() {
      moveBall();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Controller"),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            maxLeft = constraints.maxWidth - ballSize;
            maxTop = constraints.maxHeight - ballSize;
            return Stack(
              children: [
                AnimatedBuilder(
                  animation: controller!,
                  child: Positioned(left: posLeft, top: posTop, child: Ball()),
                  builder: (BuildContext context, Widget? child) {
                    moveBall();
                    return Positioned(
                        child: Ball(), left: posLeft, top: posTop);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void moveBall() {
    posLeft = animation!.value * maxLeft;
    posTop = animation!.value * maxTop;
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
