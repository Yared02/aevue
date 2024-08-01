import 'package:aevue/components/product_list.dart';
import 'package:aevue/providers/product_provider.dart';
import 'package:aevue/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// A screen displaying a list of products with filtering based on the search query
class ProductsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the productProvider to get the async value of products
    final productAsyncValue = ref.watch(productProvider);
    // Watch the searchProvider to get the current search query
    final searchQuery = ref.watch(searchProvider);

    // Handle different states of the async product data
    return productAsyncValue.when(
      // Display a loading indicator while the products are being fetched
      loading: () => Center(child: CircularProgressIndicator()),
      // Display an error message if there was an error fetching products
      error: (err, stack) => Center(child: Text('Error: $err')),
      // Display the products once they are successfully fetched
      data: (products) {
        // Filter the products based on the search query
        final filteredProducts = products.where((product) {
          return product.title
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
        }).toList();

        // Return the ProductList widget with the filtered products
        return ProductList(products: filteredProducts);
      },
    );
  }
}
