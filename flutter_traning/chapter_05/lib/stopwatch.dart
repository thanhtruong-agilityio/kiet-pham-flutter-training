import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  static const route = '/stopwatch';

  final String? name;
  final String? email;
  const StopWatch({super.key, this.name, this.email});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  // int? seconds;
  Timer? timer;
  int milliseconds = 0;
  bool isTicking = true;
  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  final itemHeight = 60.0;
  final scrollController = ScrollController();
  final laps = <int>[];

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
      scrollController.animateTo(
        itemHeight * laps.length,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
      child: ListView.builder(
        controller: scrollController,
        itemExtent: itemHeight,
        itemCount: laps.length,
        itemBuilder: (context, index) {
          final milliseconds = laps[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50),
            title: Text('Lap ${index + 1}'),
            trailing: Text(_secondsText(milliseconds)),
          );
        },
        // children: [
        //   for (int milliseconds in laps)
        //     ListTile(
        //       title: Text(_secondsText(milliseconds)),
        //     )
        // ],
      ),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // String name = ModalRoute.of(context)?.settings.arguments ?? '';
    String name = ModalRoute.of(context)?.settings.arguments!.toString() ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Container _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white),
          ),
          SizedBox(height: 20),
          _buildControls(),
        ],
      ),
    );
  }

  Row _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: isTicking ? null : _startTimer,
          child: Text('Start'),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
          ),
          child: Text('Lap'),
          onPressed: isTicking ? _lap : null,
        ),
        SizedBox(width: 20),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: isTicking ? _stopTimer : null,
          child: Text('Stop'),
        ),
        SizedBox(width: 20),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: _resetTimer,
          child: Text('reset'),
        ),
      ],
    );
  }

  void _startTimer() {
    setState(() {
      milliseconds = 0;
      timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer() {
    setState(() {
      // timer?.cancel();
      timer?.cancel();
      isTicking = false;
    });
  }

  void _resetTimer() {
    setState(() {
      milliseconds = 0;
      isTicking = false;
      timer?.cancel();
      laps.clear();
    });
  }
}
