import 'dart:convert';
import 'dart:math';
import './pizza.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

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
      title: 'Flutter JSON Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  int? appCounter;
  String documentsPath = '';
  String tempPath = '';

  @override
  void initState() {
    super.initState();
    getPaths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path Provider'),
      ),
      body: Container(
        // child: FutureBuilder(
        //   future: readJsonFile(),
        //   builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
        //     return ListView.builder(
        //       itemCount: (pizzas.data == null) ? 0 : pizzas.data!.length,
        //       itemBuilder: (BuildContext context, int position) {
        //         return ListTile(
        //           title: Text(pizzas.data![position].pizzaName),
        //           subtitle: Text(
        //               '${pizzas.data![position].description} -€ ${pizzas.data![position].price}'),
        //         );
        //       },
        //     );
        //   },
        // ),
        // child: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Text('You have opened the app $appCounter times.'),
        //       ElevatedButton(
        //         onPressed: () {
        //           deletePreference();
        //         },
        //         child: Text('Reset counter'),
        //       )
        //     ],
        //   ),
        // ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Doc path: ' + documentsPath),
              Text('Temp path: ' + tempPath),
            ],
          ),
        ),
        // child: Text(pizzaString),
      ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');

    List myMap = jsonDecode(myString);

    List<Pizza> myPizzas = [];

    myMap.forEach((dynamic pizza) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    });

    setState(() {
      // pizzaString = myString;
    });
    // String json = convertToJSON(myPizzas);
    // print(json);
    return myPizzas;
  }

  String convertToJSON(List<Pizza> pizzas) {
    String json = '[';
    pizzas.forEach((pizza) {
      json += jsonEncode(pizza);
    });
    json += ']';
    return json;
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter');
    if (appCounter == null) {
      appCounter = 1;
    } else {
      appCounter = appCounter! + 1;
    }
    await prefs.setInt('appCounter', appCounter!);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  // Future getPaths() async {
  //   final docDir = await getApplicationDocumentsDirectory();
  //   final tempDir = await getTemporaryDirectory();
  //   setState(() {
  //     documentsPath = docDir.path;
  //     tempPath = tempDir.path;
  //   });
  // }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }
}
