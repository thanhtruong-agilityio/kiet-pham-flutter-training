import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  // int? seconds;
  Timer? timer;
  int seconds = 0;
  bool isTicking = true;
  String _secondsText() => seconds == 1 && seconds == 0 ? 'second' : 'seconds';

  void _onTick(Timer time) {
    setState(() {
      seconds = seconds + 1;
    });
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$seconds ${_secondsText()}',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: isTicking ? null : _startTimer,
                child: Text('Start'),
              ),
              SizedBox(width: 20),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: isTicking ? _stopTimer : null,
                child: Text('Stop'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    setState(() {
      timer = Timer.periodic(Duration(seconds: 1), _onTick);
      isTicking = true;
    });
  }

  void _stopTimer() {
    setState(() {
      // timer?.cancel();
      timer?.cancel();
      isTicking = false;
    });
  }
}
