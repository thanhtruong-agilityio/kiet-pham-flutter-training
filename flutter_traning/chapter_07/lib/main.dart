import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String? result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back from the Future'),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
              child: Text('GO!'),
              onPressed: () {
                // getNumber().then((value) {
                //   setState(() {
                //     result = value.toString();
                //   });
                // });
                // returnFG();
                // returnError().then((value) {
                //   setState(() {
                //     result = 'Success';
                //   });
                // }).catchError((onError) {
                //   setState(() {
                //     result = onError;
                //   });
                // }).whenComplete(() => print('Complete'));
                handleError();
              },
            ),
            Spacer(),
            Text(result.toString()),
            Spacer(),
            CircularProgressIndicator(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future<Response> getData() async {
    final String authority = 'www.googleapis.com';
    final String path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  Completer? completer;
  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer!.future;
  }

  calculate() async {
    await Future.delayed(const Duration(seconds: 5));
    completer!.complete(42);
  }

  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      value.forEach((element) {
        total += element;
      });
      setState(() {
        result = total.toString();
      });
    });
  }

  Future returnError() {
    throw ('Something terrible happened!');
  }

  Future handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error as String;
      });
    } finally {
      print('Complete');
    }
  }
}
