import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipebook/components/RecipeCarouselItem.dart';
import 'package:recipebook/models/Recipe.dart';

class RecipeCarousel extends StatelessWidget {
  final List<Recipe> listOfRecipe;

  const RecipeCarousel({required this.listOfRecipe}) : super();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
        aspectRatio: 1.0,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: false,
      ),
      items: listOfRecipe.map((e) => RecipeCarouselItem(recipe: e)).toList(),
    );
  }
}
