import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'httphelper.dart';
import 'pizza.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pwdController = TextEditingController();
  String myPass = '';
  final storage = FlutterSecureStorage();
  final myKey = 'myPass';

  @override
  void initState() {
    super.initState();
    callPizzas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON')),
      body: Container(
        child: FutureBuilder(
          future: callPizzas(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>?> pizzas) {
            return ListView.builder(
              itemCount: (pizzas.data == null) ? 0 : pizzas.data!.length,
              itemBuilder: (BuildContext context, int position) {
                return ListTile(
                  title: Text(pizzas.data![position].pizzaName),
                  subtitle: Text(
                      '${pizzas.data![position].description}- € ${pizzas.data![position].price}'),
                );
              },
            );
          },
        ),
        // child: SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: Column(
        //       children: [
        //         TextField(
        //           controller: pwdController,
        //         ),
        //         ElevatedButton(
        //           child: Text('Save Value'),
        //           onPressed: () {
        //             writeToSecureStorage();
        //           },
        //         ),
        //         ElevatedButton(
        //           child: Text('Read Value'),
        //           onPressed: () {
        //             readFromSecureStorage().then((value) {
        //               setState(() {
        //                 myPass = value;
        //               });
        //             });
        //           },
        //         ),
        //         Text(myPass),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    String? secret = await storage.read(key: myKey);
    return secret!;
  }

  Future<List<Pizza>?> callPizzas() async {
    HttpHelper helper = HttpHelper();
    List<Pizza>? pizzas = await helper.getPizzaList();
    return pizzas;
  }
}
