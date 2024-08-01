import 'package:aevue/providers/search_provider.dart';
import 'package:aevue/screens/favorite_screen.dart';
import 'package:aevue/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Main screen that manages navigation between different views
class MainScreen extends ConsumerStatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  // Index to track the currently selected bottom navigation item
  int _selectedIndex = 0;

  // List of widgets for each screen to be displayed
  static List<Widget> _widgetOptions = <Widget>[
    ProductsScreen(), // First tab showing the product screen
    FavoritesScreen(), // Second tab showing the favorites screen
  ];

  // Method to handle bottom navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex =
          index; // Update the selected index and trigger UI rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with conditional title based on the selected index
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            // Display a search TextField on the ProductsScreen and a static title on the FavoritesScreen
            return _selectedIndex == 0
                ? TextField(
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                    ),
                    onChanged: (value) {
                      ref.read(searchProvider.notifier).state =
                          value; // Update search query state
                    },
                  )
                : Text('Favorites');
          },
        ),
      ),
      // Display the widget based on the selected tab
      body: _widgetOptions.elementAt(_selectedIndex),
      // Bottom navigation bar for switching between screens
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Icon for the home tab
            label: 'Home', // Label for the home tab
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Icon for the favorites tab
            label: 'Favorites', // Label for the favorites tab
          ),
        ],
        currentIndex: _selectedIndex, // Highlight the currently selected tab
        selectedItemColor: Colors.amber[800], // Color for the selected tab
        onTap: _onItemTapped, // Handle tab taps
      ),
    );
  }
}
