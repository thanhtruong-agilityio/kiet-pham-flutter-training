import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int? seconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    seconds = 0;
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer time) {
    setState(() {
      seconds = seconds! + 1;
    });
  }

  String _secondsText() => seconds == 1 ? 'second' : 'seconds';

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Text(
          '$seconds ${_secondsText()}',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
