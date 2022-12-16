import 'dart:math';

import 'package:flutter/material.dart';
import 'pizza.dart';
import 'httphelper.dart';

class PizzaDetail extends StatefulWidget {
  const PizzaDetail({super.key});

  @override
  State<PizzaDetail> createState() => _PizzaDetailState();
}

class _PizzaDetailState extends State<PizzaDetail> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  String postResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Detail'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  postResult,
                  style: TextStyle(
                      backgroundColor: Colors.green[200], color: Colors.black),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: txtId,
                  decoration: InputDecoration(hintText: 'Insert ID'),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtName,
                  decoration: InputDecoration(hintText: 'Insert Name'),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(hintText: 'Insert Description'),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtPrice,
                  decoration: InputDecoration(hintText: 'Insert Price'),
                ),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: txtImageUrl,
                  decoration: InputDecoration(hintText: 'Insert ImageUrl'),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  child: Text('Send Post'),
                  onPressed: () {
                    postPizza();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future postPizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza();
    pizza.id = int.tryParse(txtId.text)!;
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text)!;
    pizza.imageUrl = txtImageUrl.text;
    String result = await helper.postPizza(pizza);
    setState(() {
      postResult = result;
    });
    return result;
  }
}
