import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'pizza.dart';

class HttpHelper {
  final String authority = 'o80k0.mocklab.io';
  final String path = 'pizzalist';
  Future<List<Pizza>?> getPizzaList() async {
    Uri url = Uri.https(authority, path);
    http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      //provide a type argument to the map method to avoid type error
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((json) => Pizza.fromJson(json)).toList();
      return pizzas;
    }
    return null;
  }

  Future<String> postPizza(Pizza pizza) async {
    const String pathPost = 'pizza';
    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, pathPost);
    http.Response r = await http.post(
      url,
      body: post,
    );
    return r.body;
  }
}
