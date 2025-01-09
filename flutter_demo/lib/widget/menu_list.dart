import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/data/menu.dart';
import 'package:flutter_demo/widget/menu_item.dart';

import '../data/category.dart';
import 'category_item.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18.0,
          mainAxisSpacing: 18.0,
        ),
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return MenuItem(
              image: menus[index]['image']!,
              title: menus[index]['title']!,
              page: menus[index]['page']!);
        },
      ),
    );
  }
}
