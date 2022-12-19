import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color? bgColor;
  ColorStream? colorStream;
  int? lastNumber;
  StreamController? numberStreamController;
  NumberStream? numberStream;

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream!.controller;
    Stream stream = numberStreamController!.stream;
    stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: Text("New random Number"),
            )
          ],
        ),
      ),
    );
  }

  changeColor() async {
    await for (var eventColor in colorStream!.getColor()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(100);
    numberStream!.addNumberToSink(myNum);
  }
}
