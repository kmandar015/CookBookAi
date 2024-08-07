import 'dart:developer';

import 'package:cook_book_ai/app/core/constants/data.dart';
import 'package:cook_book_ai/app/core/models/recipe.dart';


class RecipeHelper {

  static List<Recipe> getFeaturedRecipes() {
    return _parseRecipes(featuredRecipeRawData);
  }

  static List<Recipe> getRecommendationRecipes() {
    return _parseRecipes(recommendationRecipeRawData);
  }

  static List<Recipe> getNewlyPostedRecipes() {
    return _parseRecipes(newlyPostedRecipeRawData);
  }

  static List<Recipe> getSweetFoodRecommendationRecipes() {
    return _parseRecipes(sweetFoodRecommendationRecipeRawData);
  }

  static Recipe getPopularRecipe() {
    try {
      return Recipe.fromJson(popularRecipeRawData as Map<String, dynamic>);
    } catch (e) {
      // Handle error, e.g., logic or return a default Recipe
      log(  'Error parsing popular recipe: $e');
      return Recipe(
        title: 'Error',
        photo: '',
        calories: '',
        time: '',
        description: '',
        ingredients: [],
        tutorial: [],
        reviews: [],
      );
    }
  }

  static List<Recipe> getSearchResultRecipes() {
    return _parseRecipes(recipeSearchResultRawData);
  }

  static List<Recipe> getBookmarkedRecipes() {
    return _parseRecipes(bookmarkedRecipeRawData);
  }

  // Helper method to parse a list of recipe data
  static List<Recipe> _parseRecipes(dynamic rawData) {
    return (rawData as List<dynamic>)
        .map((data) {
      try {
        return Recipe.fromJson(data as Map<String, dynamic>);
      } catch (e) {
        // Handle error, e.g., log it or return a default Recipe
        print('Error parsing recipe: $e');
        return Recipe(
          title: 'Error',
          photo: '',
          calories: '',
          time: '',
          description: '',
          ingredients: [],
          tutorial: [],
          reviews: [],
        );
      }
    })
        .toList();
  }
}



