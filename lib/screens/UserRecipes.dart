import 'package:flutter/material.dart';
import 'package:recipebook/components/RecipeList.dart';
import 'package:recipebook/models/Recipe.dart';
import 'package:recipebook/services/RecipeService.dart';

class UserRecipesScreen extends StatefulWidget {
  const UserRecipesScreen({Key? key}) : super(key: key);

  @override
  _UserRecipesScreenState createState() => _UserRecipesScreenState();
}

class _UserRecipesScreenState extends State<UserRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'My recipes'),
              Tab(text: 'Saved recipes'),
            ],
          ),
          automaticallyImplyLeading: true,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search a recipe...'
            ),
          ),
          actions: [
            IconButton(
                onPressed: () { },
                icon: const Icon(Icons.search)
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () { },
            )
          ],
        ),
        body: TabBarView(
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      return Center(child: CircularProgressIndicator());
                    }
                  }
              )
            ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          return Center(child: CircularProgressIndicator());
                        }
                      }
                  )
                ])
          ]
        ),
      ),
    );
  }
}
