import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widget/carousel_image.dart';
import '../widget/category_list.dart';
import '../widget/menu_list.dart';
import '../widget/profile.dart';
import '../widget/search_bar.dart';

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
            SizedBox(height: 30),
            CarouselImage(),
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
            SizedBox(height: 8),
            MenuList()
          ],
        ),
      )),
    );
  }
}
