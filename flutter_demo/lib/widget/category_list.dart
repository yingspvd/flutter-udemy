import 'package:flutter/cupertino.dart';

import '../data/category.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // Makes the list scroll horizontally
        itemCount: categories.length,
        itemBuilder: (context, index) {
          // return Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   // Add space between items
          //   child: CategoryItem(
          //     image: categories[index]['image']!,
          //     title: categories[index]['title']!,
          //   ),
          // );
        },
      ),
    );
  }
}
