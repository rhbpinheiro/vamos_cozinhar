import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category? category;

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategotiesMealsPage(category: category);
    //     },
    //   ),
    // );
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  const CategoryItem({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category!.color!.withOpacity(.5),
              category!.color!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category!.title!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
