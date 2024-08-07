import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:cook_book_ai/app/core/models/recipe.dart';
import 'package:cook_book_ai/app/core/utils/recipe_helper.dart';
import 'package:cook_book_ai/app/core/widgets/recipe_tile.dart';
import 'package:flutter/material.dart';

class NewlyPostedScreen extends StatelessWidget {
  final TextEditingController searchInputController = TextEditingController();
  final List<Recipe> newlyPostedRecipe = RecipeHelper.getNewlyPostedRecipes();
  NewlyPostedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // brightness: Brightness.dark,
        backgroundColor: ColorConstant.primary,
        centerTitle: true,
        elevation: 0,
        title: const Text('Newly Posted', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w400, fontSize: 16,color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: newlyPostedRecipe.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (context, index) {
          return RecipeTile(
            data: newlyPostedRecipe[index],
          );
        },
      ),
    );
  }
}
