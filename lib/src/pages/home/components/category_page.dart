import 'package:flutter/material.dart';
import 'package:greengocer/src/config/app_data.dart' as appData;
import 'package:greengocer/src/pages/home/category_tile.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return CategoryTile(
            onPressed: () {
              setState(() {
                selectedCategory = appData.categories[index];
              });
            },
            category: appData.categories[index],
            isSelected: appData.categories[index] == selectedCategory,
          );
        },
        separatorBuilder: (_, index) => const SizedBox(width: 8),
        itemCount: appData.categories.length,
      ),
    );
  }
}
