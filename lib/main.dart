import 'package:exemplo_navegacoes/screens/categories_meals_screen.dart';
import 'package:exemplo_navegacoes/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'screens/seetings_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Releway',
        canvasColor: Color.fromRGBO(255,254,229,1) ,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          )

        )
      ),

      routes: {
       AppRoutes.HOME: (ctx)=> TabsScreen(),
       AppRoutes.CATEGORIES_MEALS: (ctx)=> CategoriesMealsScreen(),
       AppRoutes.MEAL_DETAIL: (ctx)=> MealDetailScreen(),
       AppRoutes.SETTINGS: (ctx)=> SettingsScreen(),
      },

    );
  }
}
