import 'dart:convert';
import 'dart:math';
import './pizza.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    readJsonFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON'),
      ),
      body: Container(
        child: FutureBuilder(
          future: readJsonFile(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
            return ListView.builder(
              itemCount: (pizzas.data == null) ? 0 : pizzas.data!.length,
              itemBuilder: (BuildContext context, int position) {
                return ListTile(
                  title: Text(pizzas.data![position].pizzaName),
                  subtitle: Text(
                      '${pizzas.data![position].description} -€ ${pizzas.data![position].price}'),
                );
              },
            );
          },
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
}
