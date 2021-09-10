import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = new TextEditingController();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search a recipe');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: _searchIcon,
          onPressed: searchPressed,
        ),
        title: _appBarTitle,
      ),
    );
  }

  void searchPressed() {
    setState(() {
        if(_searchIcon.icon == Icons.search) {
          _searchIcon = new Icon(Icons.close);
          _appBarTitle = new TextField(
            controller: _filter,
            decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...',
            ),
          );
        } else {
          _searchIcon = new Icon(Icons.search);
          _appBarTitle = new Text( 'Search a recipe' );
        }
    });
  }
}


