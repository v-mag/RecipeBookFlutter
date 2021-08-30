import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/components/RecipeCarousel.dart';
import 'package:recipebook/models/Recipe.dart';
import 'package:recipebook/services/RecipeService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 35.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Discover", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("some new recipes", style: TextStyle(fontSize: 30),),
                ),
              ),
              FutureBuilder<List<Recipe>>(
                future: RecipeService().getRandomRecipes("chicken"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    return Expanded(child: RecipeCarousel(listOfRecipe: snapshot.data!));
                  } else {
                    return Expanded(child: Center(child: CircularProgressIndicator()));
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
