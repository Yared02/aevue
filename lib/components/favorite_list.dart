import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_item.dart';

// A stateless widget that displays a list of favorite products
class FavoriteList extends StatelessWidget {
  // A list of Product objects
  final List<Product> products;

  // Constructor for initializing the products list
  FavoriteList({required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        // If no favorite products, show a message
        ? Center(child: Text('No favorite items'))
        // If there are favorite products, display them in a ListView
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductItem(product: products[index]);
            },
          );
  }
}
