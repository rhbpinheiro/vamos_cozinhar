import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailPage extends StatefulWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;
  const MealDetailPage({
    Key? key,
    required this.onToggleFavorite,
    required this.isFavorite,
  }) : super(key: key);

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  @override
  Widget build(BuildContext context) {
    
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title!,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
            _createSectiontitle(
              context,
              'Ingredientes',
            ),
            _createSectionContainer(
              meal,
              ListView.builder(
                itemCount: meal.ingredients!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        meal.ingredients![index],
                      ),
                    ),
                  );
                },
              ),
            ),
            _createSectiontitle(
              context,
              'Passos',
            ),
            _createSectionContainer(
              meal,
              ListView.builder(
                itemCount: meal.steps!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1} '),
                        ),
                        title: Text(meal.steps![index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          widget.isFavorite(meal) ? Icons.star : Icons.star_border,
          color: Colors.black,
        ),
        onPressed: () {
          widget.onToggleFavorite(meal);
        },
      ),
    );
  }

  Container _createSectionContainer(Meal meal, Widget child) {
    return Container(
        width: 400,
        height: 250,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  Container _createSectiontitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
