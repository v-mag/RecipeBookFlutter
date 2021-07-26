import 'package:flutter/material.dart';
import 'package:recipebook/components/RecipeItem.dart';
import 'package:recipebook/models/Recipe.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> listOfRecipe;

  const RecipeList({required this.listOfRecipe}) : super();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.fit(2),
          itemCount: listOfRecipe.length,
          itemBuilder: (context, index) {
            return RecipeItem(recipe: listOfRecipe[index]);
          }
      ),
    );
  }
}
