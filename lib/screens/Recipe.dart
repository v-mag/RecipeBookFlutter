import 'package:flutter/material.dart';
import 'package:recipebook/models/Recipe.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeScreen({required this.recipe}) : super();

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image(
              image: NetworkImage(widget.recipe.image),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row()
          )
        ],
      ),
    );
  }
}
