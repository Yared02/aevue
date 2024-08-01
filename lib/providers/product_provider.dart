import 'package:aevue/service/baseUrl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

// Define a FutureProvider to fetch the list of products
final productProvider = FutureProvider<List<Product>>((ref) async {
  // Make an HTTP GET request to the API
  final response = await http.get(Uri.parse(apiUrl));

  // Check if the response status is OK (status code 200)
  if (response.statusCode == 200) {
    // Decode the JSON response and extract the list of products
    final List<dynamic> json = jsonDecode(response.body)['products'];
    // Convert the list of JSON objects to a list of Product objects and return it
    return json.map((productJson) => Product.fromJson(productJson)).toList();
  } else {
    // Throw an exception if the request fails
    throw Exception('Failed to load products');
  }
});
