import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search App'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  var cities = [
    "mataram",
    "praya",
    "sumbawa besar",
    "bima",
    "bandung",
    "surabaya",
    "jakarta",
    "medan",
    "palembang",
    "pontianak",
    "yogyakarta"
  ];
  var recentCity = [
    "mataram",
    "praya",
    "sumbawa besar",
    "bima",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    //Actions for app bar
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    //leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //show some result based on the selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //what you want to show when someone searches for something
  }
}
