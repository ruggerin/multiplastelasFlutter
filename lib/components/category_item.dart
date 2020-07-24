import 'package:exemplo_navegacoes/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class  CategoryItem extends StatelessWidget{
  final Category category;
  CategoryItem(this.category);
 // const CategoryItem({Key key, this.category}) : super(key: key);



  @override
  Widget build(BuildContext context) {
      return Container(
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

      );

  }
  
}