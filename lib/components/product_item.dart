import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../providers/favorites_provider.dart';

class ProductItem extends ConsumerWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoritesProvider).contains(product);

    return Card(
      child: ListTile(
        leading: Image.network(product.thumbnail),
        title: Text(product.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.description),
            Text('\$${product.price}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            final notifier = ref.read(favoritesProvider.notifier);
            isFavorite
                ? notifier.removeFavorite(product)
                : notifier.addFavorite(product);
          },
        ),
      ),
    );
  }
}
