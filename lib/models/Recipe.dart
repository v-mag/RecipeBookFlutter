import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'Recipe.g.dart';

@Database(version: 1, entities: [Recipe])
abstract class RecipeDatabase extends FloorDatabase {
  RecipeDao get recipeDao;
}

@dao
abstract class RecipeDao {
  @Query('SELECT * FROM Recipe')
  Future<List<Recipe>> getAllRecipe();

  @Query('SELECT * FROM Recipe WHERE uid=:id')
  Future<Recipe?> getRecipeById(int id);

  @insert
  Future<void> addRecipe(Recipe recipe);

  @update
  Future<void> updateRecipe(Recipe recipe);

  @delete
  Future<void> deleteRecipe(Recipe recipe);

  @Query('DELETE FROM Recipe')
  Future<void> deleteAllRecipe();

  @Query('SELECT EXISTS(SELECT * FROM RecipeItem WHERE uid = :id)')
  Future<bool?> rowExists(int id);
}

@entity
class Recipe {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String title;

  final String image;

  final int readyInMinutes;

  final int servings;

  final int aggregateLikes;

  final String instructions;

  final int healthScore;

  Recipe(this.id, this.title, this.image, this.readyInMinutes, this.servings, this.aggregateLikes, this.instructions, this.healthScore);

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(json['id'], json['title'], json['image'], json['readyInMinutes'], json['servings'], json['aggregateLikes'], json['instructions'], json['healthScore']);
  }
}