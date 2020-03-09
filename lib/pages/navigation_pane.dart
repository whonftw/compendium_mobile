import 'package:compendium_mobile/pages/recipes.dart';
import 'package:compendium_mobile/strings/pages.dart';
import 'package:compendium_mobile/strings/resources.dart';
import 'package:compendium_mobile/util/drawer_item.dart';
import 'package:flutter/material.dart';

class NavigationPane extends StatefulWidget
{
  final drawerItems = [
    new DrawerItem(Pages.recipes, Icons.list),
  ];

  @override
  State<StatefulWidget> createState() {
    return new NavigationPaneState();
  }
  
}

class NavigationPaneState extends State<NavigationPane> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new RecipesPage();
      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text(Resources.appTitle), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}