import 'package:exemplo_navegacoes/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../screens/categories_meals_screen.dart';

class  CategoryItem extends StatelessWidget{
  final Category category;
  const CategoryItem(this.category);
 // const CategoryItem({Key key, this.category}) : super(key: key);
  void _selectCategory(BuildContext context){
    /*
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_){
            return CategoriesMealsScreen(category);
          },

        )
    );*/
    Navigator.of(context).pushNamed('/categories-meals', arguments: category);

  }


  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: ()=> _selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius:  BorderRadius.circular(20),

        child: Container(
          
          padding: EdgeInsets.all(15),
          child: Text(
              category.title,
              style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.5),
              category.color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)

          ),

        ),
      );

  }
  
}