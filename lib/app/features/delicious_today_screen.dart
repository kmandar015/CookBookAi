import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:cook_book_ai/app/core/models/recipe.dart';
import 'package:cook_book_ai/app/core/utils/recipe_helper.dart';
import 'package:cook_book_ai/app/core/widgets/popular_recipe_card.dart';
import 'package:cook_book_ai/app/core/widgets/recipe_tile.dart';
import 'package:flutter/material.dart';

class DeliciousTodayScreen extends StatelessWidget {
  final Recipe popularRecipe = RecipeHelper.getPopularRecipe();
  final List<Recipe> featuredRecipe = RecipeHelper.getFeaturedRecipes();
  DeliciousTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: ColorConstant.primary,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Delicious Today',
          style: TextStyle(
              fontFamily: 'inter',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Popular Recipe
          Container(
            color: ColorConstant.primary,
            alignment: Alignment.topCenter,
            height: 210,
            padding: const EdgeInsets.all(16),
            child: PopularRecipeCard(data: popularRecipe),
          ),
          // Section 2 - Bookmarked Recipe
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: featuredRecipe.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemBuilder: (context, index) {
                return RecipeTile(
                  data: featuredRecipe[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
