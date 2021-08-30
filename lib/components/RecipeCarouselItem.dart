import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/models/Recipe.dart';
import 'package:recipebook/screens/Recipe.dart';


class RecipeCarouselItem extends StatelessWidget {

  final Recipe recipe;

  const RecipeCarouselItem({required this.recipe}) : super();

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
            child: Column(
              children: [
                Stack(
                  children: [
                    recipe.image != "" ?
                    Image(
                      image: NetworkImage(recipe.image),
                    ) :
                    Icon(Icons.image_not_supported),
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
                                Icon(Icons.timer, size: 22, color: Colors.white),
                                SizedBox(width: 3),
                                Text(recipe.readyInMinutes.toString(), style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        top: 10,
                        left: 70,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Icon(Icons.people, size: 22, color: Colors.white),
                                SizedBox(width: 3),
                                Text(recipe.servings.toString(), style: TextStyle(color: Colors.white))
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
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Icon(Icons.thumb_up, size: 22),
                              SizedBox(width: 3),
                              Text(recipe.aggregateLikes.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(child: Text(recipe.title, style: TextStyle(fontSize: 20), maxLines: 5, overflow: TextOverflow.ellipsis,)),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Icon(Icons.bookmark_add_outlined),
                      style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    ))),
                  ),
                )
              ],
            )
        )
    );
  }
}
