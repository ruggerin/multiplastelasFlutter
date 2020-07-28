import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_secreen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState()=> _TabsScreenState();

}

class _TabsScreenState  extends State<TabsScreen>{
  int  _selectedScreenIndex = 0 ;
  final List<Map<String , Object>> screens = [
    {'title': 'Categorias', 'screen': CategoriesScreen()},
    {'title': 'Favoritos', 'screen':  FavoriteScreen()}
  ];
  _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text( screens[_selectedScreenIndex]['title']),
      ),
      body: screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar:BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white ,
          selectedItemColor: Theme.of(context).accentColor ,
          currentIndex: _selectedScreenIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon( Icons.category),
                title: Text('Categorias')
            ),
            BottomNavigationBarItem(
                icon: Icon( Icons.star),
                title: Text('Favoritos')
            )
          ]
      ) ,
    );

    /*
  Tab Header
  return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Vamo cozinhar?'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text:  'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text:  'Favoritos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen()

          ],
        )

      ),
    );*/
  }
}

