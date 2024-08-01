import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_item.dart';

// A stateless widget that displays a list of products
class ProductList extends StatelessWidget {
  // A list of Product objects
  final List<Product> products;

  // Constructor for initializing the products list
  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // Number of items in the list
      itemCount: products.length,
      // Function to build each item in the list
      itemBuilder: (context, index) {
        // Return a ProductItem widget for each product in the list
        return ProductItem(product: products[index]);
      },
    );
  }
}
