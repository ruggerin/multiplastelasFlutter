import 'package:exemplo_navegacoes/screens/categories_meals_screen.dart';
import 'package:exemplo_navegacoes/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'screens/seetings_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
import 'models/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaiableMeals = DUMMY_MEALS;
  void _filterMeals(Settings settings){
    setState(() {
      this.settings = settings;
      _avaiableMeals = DUMMY_MEALS.where(
          (meal){
            final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
            final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
            final filterVegan = settings.isVegan && !meal.isVegan;
            final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
            return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
          }
      ).toList();
    });
  }

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
       AppRoutes.CATEGORIES_MEALS: (ctx)=> CategoriesMealsScreen(_avaiableMeals),
       AppRoutes.MEAL_DETAIL: (ctx)=> MealDetailScreen(),
       AppRoutes.SETTINGS: (ctx)=> SettingsScreen(settings, _filterMeals),
      },

    );
  }
}
