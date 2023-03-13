import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_page.dart';
import 'favorite_page.dart';

class TabsPages extends StatefulWidget {
  final List<Meal> favoritesMeals;
  const TabsPages({
    Key? key,
    required this.favoritesMeals,
  }) : super(key: key);

  @override
  State<TabsPages> createState() => _TabsPagesState();
}

class _TabsPagesState extends State<TabsPages> {
  int _selectedPageIndex = 0;
  // final List<Widget> _pages = [
  //   CategoriesPage(),
  //   FavoritePage(),
  // ];
  List<Map<String, Object>>? _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'title': 'Lista de Categorias',
        'page': const CategoriesPage(),
      },
      {
        'title': 'Meus Favoritos',
        'page': FavoritePage(favoritesMeals: widget.favoritesMeals),
      },
    ];
  }

  _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages![_selectedPageIndex]['title'] as String,
        ),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: _pages![_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          )
        ],
      ),
    );
    //tab bar superior
    //   return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text('Vamos Cozinhar?'),
    //         centerTitle: true,
    //         bottom: const TabBar(
    //           tabs: [
    //             Tab(
    //               icon: Icon(Icons.category),
    //               text: 'Categorias',
    //             ),
    //             Tab(
    //               icon: Icon(Icons.star),
    //               text: 'Favoritos',
    //             ),
    //           ],
    //         ),
    //       ),
    //       body: const TabBarView(
    //         children: [
    //           CategoriesPage(),
    //           FavoritePage(),
    //         ],
    //       ),
    //     ),
    //   );
    // }
  }
}
