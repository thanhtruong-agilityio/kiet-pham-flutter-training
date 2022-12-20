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
  // NumberStream? numberStream;
  StreamTransformer? transformer;
  StreamSubscription? subscription;
  StreamSubscription? subscription2;
  String values = '';
  Stream<int>? numberStream;

  @override
  void initState() {
    super.initState();
    // numberStream = NumberStream();
    // numberStreamController = numberStream!.controller;
    // Stream stream = numberStreamController!.stream.asBroadcastStream();

    // subscription = stream.listen((event) {
    //   setState(() {
    //     values += '$event - ';
    //   });
    // });
    // subscription2 = stream.listen((event) {
    //   setState(() {
    //     values += '$event - ';
    //   });
    // });
    // subscription!.onError((error) {
    //   setState(() {
    //     lastNumber = -1;
    //   });
    // });
    // subscription!.onDone(() {
    //   print('OnDone was called');
    // });
    numberStream = NumberStream().getNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: numberStream,
          initialData: 0,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error!");
            }
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 96),
                ),
              );
            } else {
              return Center();
            }
          },
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

  // void addRandomNumber() {
  //   Random random = Random();
  //   int myNum = random.nextInt(10);
  //   if (!numberStreamController!.isClosed) {
  //     numberStream!.addNumberToSink(myNum);
  //   } else {
  //     setState(() {
  //       lastNumber = -1;
  //     });
  //   }
  // }

  void stopStream() {
    numberStreamController!.close();
  }
}
