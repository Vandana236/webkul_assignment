import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      _products = List<Product>.from(data.map((product) => Product(
        title: product['title'],
        price: product['price'].toDouble(),
        image: product['image'],
        description: product['description'],
        rating: product['rating']['rate'].toDouble(),
      )));

      notifyListeners();
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
