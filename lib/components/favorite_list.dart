import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_item.dart';

class FavoriteList extends StatelessWidget {
  final List<Product> products;

  FavoriteList({required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Center(child: Text('No favorite items'))
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductItem(product: products[index]);
            },
          );
  }
}
