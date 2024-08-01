import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

// Define a StateNotifierProvider for managing the list of favorite products
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Product>>((ref) {
  return FavoritesNotifier();
});

// FavoritesNotifier class to manage the state of favorite products
class FavoritesNotifier extends StateNotifier<List<Product>> {
  // Constructor initializing the state as an empty list
  FavoritesNotifier() : super([]);

  // Method to add a product to the favorites list
  void addFavorite(Product product) {
    state = [...state, product];
  }

  // Method to remove a product from the favorites list
  void removeFavorite(Product product) {
    state = state.where((item) => item.id != product.id).toList();
  }
}
