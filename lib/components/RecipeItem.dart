import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/models/Recipe.dart';
import 'package:recipebook/screens/Recipe.dart';


class RecipeItem extends StatelessWidget {

  final Recipe recipe;

  const RecipeItem({required this.recipe}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeScreen(recipe: recipe)));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Stack(
            children: [
              Image(
                image: NetworkImage(recipe.image),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Icon(Icons.timer, size: 12, color: Colors.white),
                        SizedBox(width: 3),
                        Text(recipe.readyInMinutes.toString(), style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                )
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Icon(Icons.people, size: 12, color: Colors.white),
                          SizedBox(width: 3),
                          Text(recipe.servings.toString(), style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  )
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Icon(Icons.thumb_up, size: 12),
                        SizedBox(width: 3),
                        Text(recipe.aggregateLikes.toString()),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        )
      );
  }
}
