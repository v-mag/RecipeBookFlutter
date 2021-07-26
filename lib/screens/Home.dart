import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/components/RecipeList.dart';
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
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {

            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Filter by: "),
                Chip(label: Text("Random")),
                Chip(label: Text("Favorite dish")),
                Chip(label: Text("Favorite food")),
              ],
            ),
            FutureBuilder<List<Recipe>>(
              future: RecipeService().getAll(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error has occurred!'),
                  );
                } else if (snapshot.hasData) {
                  return RecipeList(listOfRecipe: snapshot.data!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
