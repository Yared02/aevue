import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Product>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<List<Product>> {
  FavoritesNotifier() : super([]);

  void addFavorite(Product product) {
    state = [...state, product];
  }

  void removeFavorite(Product product) {
    state = state.where((item) => item.id != product.id).toList();
  }
}
