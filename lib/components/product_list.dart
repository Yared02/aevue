import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(product: products[index]);
      },
    );
  }
}
