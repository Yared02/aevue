import 'package:aevue/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child:
          MyApp())); // Wrapping the app with ProviderScope to enable Riverpod's state management
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aevue assessment', // Title of the application
      theme: ThemeData(
        primarySwatch: Colors.blue, // Primary color theme for the application
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(), // The main screen of the application
    );
  }
}
