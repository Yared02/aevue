import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../providers/favorites_provider.dart';

class ProductItem extends ConsumerWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Check if the product is in the user's favorites list
    final isFavorite = ref.watch(favoritesProvider).contains(product);

    return Card(
      elevation: 8.0, // Adds shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Rounds card corners
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(12.0),
        leading: Stack(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(16.0), // Circular image border
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 4), // Shadow position
                    ),
                  ],
                ),
                // Display product thumbnail
                child: Image.network(
                  product.thumbnail,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Placeholder in case of image load error
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.error, color: Colors.red),
                    );
                  },
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) {
                      return child; // Show image once loaded
                    } else {
                      return Center(
                        child: CircularProgressIndicator(), // Loading indicator
                      );
                    }
                  },
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          product.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              '\$${product.price}',
              style: TextStyle(
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
            size: 24.0,
          ),
          onPressed: () {
            final notifier = ref.read(favoritesProvider.notifier);
            // Toggle favorite status
            isFavorite
                ? notifier.removeFavorite(product)
                : notifier.addFavorite(product);
          },
        ),
      ),
    );
  }
}
