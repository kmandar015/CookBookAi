import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:cook_book_ai/app/core/models/generated_recipe.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SavedRecipesScreen extends StatefulWidget {
  const SavedRecipesScreen({super.key});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  late final Box<GeneratedRecipe> _recipeBox;

  @override
  void initState() {
    super.initState();
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _recipeBox = await Hive.openBox<GeneratedRecipe>('recipes');
    setState(() {}); // Refresh UI after box is opened
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saved Recipes",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: ColorConstant.primary,
      ),
      body: FutureBuilder(
        future: _initializeBox(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_recipeBox.isEmpty) {
            return const Center(child: Text("No saved recipes."));
          }

          return ListView.builder(
            itemCount: _recipeBox.length,
            itemBuilder: (context, index) {
              final recipe = _recipeBox.getAt(index);
              return ListTile(
                title: Text(recipe!.name),
                subtitle: Text("Total Time: ${recipe.totalTime} mins"),
                onTap: () => _showRecipeDetails(context, recipe),
              );
            },
          );
        },
      ),
    );
  }

  void _showRecipeDetails(BuildContext context, GeneratedRecipe recipe) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(recipe.name),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ingredients:'),
                ...recipe.ingredients.map((ingredient) => Text(
                      '${ingredient.name}: ${ingredient.quantity}',
                      style: const TextStyle(fontSize: 16),
                    )),
                const SizedBox(height: 16),
                const Text('Instructions:'),
                ...recipe.instructions.map((instruction) => Text(
                      instruction,
                      style: const TextStyle(fontSize: 16),
                    )),
                const SizedBox(height: 16),
                const Text('Nutrition:'),
                Text('Calories: ${recipe.nutrition.calories}',
                    style: const TextStyle(fontSize: 16)),
                Text('Protein: ${recipe.nutrition.protein}',
                    style: const TextStyle(fontSize: 16)),
                Text('Fat: ${recipe.nutrition.fat}',
                    style: const TextStyle(fontSize: 16)),
                Text('Carbohydrates: ${recipe.nutrition.carbohydrates}',
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 16),
                Text('Total Time: ${recipe.totalTime} minutes',
                    style: const TextStyle(fontSize: 16)),
                Text('Servings: ${recipe.servings}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
