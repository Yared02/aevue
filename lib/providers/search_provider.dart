import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a StateProvider for managing the search query string
final searchProvider = StateProvider<String>((ref) => '');
