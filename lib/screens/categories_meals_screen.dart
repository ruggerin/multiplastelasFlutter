import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget{
  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals);
  /*
  Passar via construtor
  final Category category;

  const CategoriesMealsScreen(this.category);*/

  @override
  Widget build(BuildContext context) {
    final category =  ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = meals.where((meal){
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
      ),
      body: Center(
        //child: Text('Receitas por Categoria ${category.id}')
        child: ListView.builder(
          itemCount: categoryMeals.length,
            itemBuilder: (ctx, index){
              return MealItem(categoryMeals[index]);
            }
        ),
      )
    );
  }
  
}