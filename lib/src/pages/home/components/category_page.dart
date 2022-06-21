import 'package:flutter/material.dart';
import 'package:greengocer/src/pages/home/category_tile.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> categories = [
    'Frutas',
    'Grãos,',
    'Verdura',
    'Temperos',
    'Cereais',
  ];

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
                selectedCategory = categories[index];
              });
            },
            category: categories[index],
            isSelected: categories[index] == selectedCategory,
          );
        },
        separatorBuilder: (_, index) => const SizedBox(width: 8),
        itemCount: categories.length,
      ),
    );
  }
}
