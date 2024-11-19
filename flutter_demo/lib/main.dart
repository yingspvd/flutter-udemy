import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/category_list.dart';
import 'package:flutter_demo/widget/profile.dart';
import 'package:flutter_demo/widget/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Profile(),
            SizedBox(height: 14),
            // search bar
            Searchbar(),
            SizedBox(height: 14),
            Text(
              "Select by category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // category
            CategoryList(),
            Text(
              "Popular menu items",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )),
    );
  }
}
