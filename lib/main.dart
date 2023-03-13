import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/settings.dart';
import 'package:shop/pages/categoties_meals_page.dart';
import 'package:shop/pages/meal_detail_page.dart';
import 'package:shop/pages/settings_page.dart';
import 'package:shop/pages/tabs_pages.dart';
import 'package:shop/utils/app_routes.dart';

import 'models/meal.dart';
import 'pages/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoritesMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    _favoritesMeals.contains(meal)
        ? _favoritesMeals.remove(meal)
        : _favoritesMeals.add(meal);
  }

  bool _isFavorite(Meal meal) {
    return _favoritesMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DeliMeals',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        routes: {
          AppRoutes.HOME: (context) => TabsPages(
                favoritesMeals: _favoritesMeals,
              ),
          AppRoutes.CATEGORIES_MEALS: (context) =>
              CategotiesMealsPage(meals: _availableMeals),
          AppRoutes.MEAL_DETAIL: (context) => MealDetailPage(
                onToggleFavorite: _toggleFavorite,
                isFavorite: _isFavorite,
              ),
          AppRoutes.SETTINGS: (context) => SetingsPage(
                onChangeSettings: _filterMeals,
                settings: settings,
              ),
        });
  }
}
