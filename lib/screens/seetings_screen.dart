import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingChanged;

  const SettingsScreen(this.settings, this.onSettingChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();

}
class _SettingsScreenState extends State<SettingsScreen>{
  Settings settings ;
  @override
  void initState(){
    super.initState();
    settings = widget.settings;
  }


  Widget _createSwitch(String title , String subtitle, bool value, Function onChanged){
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value){
          onChanged(value);
          widget.onSettingChanged(settings);
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Configuração'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Configurações', style: Theme.of(context).textTheme.title,),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _createSwitch(
                    'Sem glutem',
                    'Só exibe refeições sem glutén',
                    settings.isGlutenFree,
                    (value)=>setState( ()=>settings.isGlutenFree = value)
                  ),
                  _createSwitch(
                    'Sem latose',
                    'Só exibe refeições sem lactose',
                    settings.isLactoseFree,
                    (value)=>setState( ()=>settings.isLactoseFree = value)
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições vegana',
                    settings.isVegan,
                    (value)=>setState( ()=>settings.isVegan = value)
                  ),
                  _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições vetegarianas',
                    settings.isVegetarian,
                    (value)=>setState( ()=>settings.isVegetarian = value)
                  ),

                ],
              ),
            )
          ],
        )

    );
  }
}
