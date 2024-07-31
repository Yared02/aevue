// providers/product_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

final productProvider = FutureProvider<List<Product>>((ref) async {
  final response = await http
      .get(Uri.parse('https://dummyjson.com/products/search?q=phone'));

  if (response.statusCode == 200) {
    final List<dynamic> json = jsonDecode(response.body)['products'];
    return json.map((productJson) => Product.fromJson(productJson)).toList();
  } else {
    throw Exception('Failed to load products');
  }
});
