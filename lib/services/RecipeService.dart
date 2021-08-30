import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:recipebook/models/Recipe.dart';

var url = Uri.parse('https://api.spoonacular.com/recipes/');

class RecipeService {
  Future<List<Recipe>> getAll() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/Recipe'));
    if(response.statusCode == 200) {
      return compute(parseRecipes, response.body);
    } else {
      throw Exception('Failed to get all recipes');
    }
  }

  Future<Recipe> getById(int id) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/Recipe/$id'));
    if(response.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get one recipe');
    }
  }

  Future<List<Recipe>> getRandomRecipes(String tag) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/random/$tag'));
    if(response.statusCode == 200) {
      return compute(parseRecipes, response.body);
    } else {
      throw Exception('Failed to get random recipes');
    }
  }
}

List<Recipe> parseRecipes(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Recipe>((json) => Recipe.fromJson(json)).toList();
}