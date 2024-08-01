import 'package:aevue/components/favorite_list.dart';
import 'package:aevue/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// A screen displaying the list of favorite products
class FavoritesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the favoritesProvider to get the current list of favorite products
    final favoriteProducts = ref.watch(favoritesProvider);

    // Return the FavoriteList widget with the list of favorite products
    return FavoriteList(products: favoriteProducts);
  }
}
