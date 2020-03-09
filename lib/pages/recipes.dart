import 'package:compendium_mobile/services/recipes_service.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  var appTitle="1";
  @override
  Widget build(BuildContext context) {
    fetchAlbum().then((val) => appTitle = "Hello from recipes");
    return new Center(
      child: new Text(appTitle),
    );
  }

}