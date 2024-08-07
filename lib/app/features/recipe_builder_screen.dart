import 'dart:developer';
import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:cook_book_ai/app/core/models/generated_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import '../core/utils/generated_recipe_helper.dart';

class RecipeBuilderScreen extends StatefulWidget {
  const RecipeBuilderScreen({super.key});

  @override
  State<RecipeBuilderScreen> createState() => _RecipeBuilderScreenState();
}

class _RecipeBuilderScreenState extends State<RecipeBuilderScreen> {
  bool _showRecipe = false;
  bool _isSaved = false;
  bool _isLoading = false;
  final List<String> _ingredients = [];
  final TextEditingController _ingredientController = TextEditingController();
  GeneratedRecipe? _recipe;

  @override
  void initState() {
    super.initState();
    _initializeBox();
  }

  Box<GeneratedRecipe>? _recipeBox;

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  Future<void> _initializeBox() async {
    if (!Hive.isBoxOpen('recipes')) {
      _recipeBox = await Hive.openBox<GeneratedRecipe>('recipes');
    } else {
      _recipeBox = Hive.box<GeneratedRecipe>('recipes');
    }
  }

  Future<void> _saveRecipe() async {
    await _initializeBox();
    if (_recipe != null && _recipeBox != null && _recipeBox!.isOpen) {
      await _recipeBox!.add(_recipe!);
      setState(() {
        _isSaved = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recipe saved successfully!')),
      );
    }
  }

  Future<void> _fetchRecipe() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final recipeJson = await generateRecipe(_ingredients);
      log(recipeJson.toString());
      setState(() {
        _recipe = GeneratedRecipe.fromJson(recipeJson);
        _showRecipe = true;
        _isLoading = false;
      });
    } catch (e) {
      log('Failed to generate recipe: $e');
      setState(() {
        _isLoading = false;
      });
      // Handle the error as needed, e.g., show a snack bar or alert.
    }
  }


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorConstant.primary,
          title: const Text(
            "Craft Your Dish",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, '/savedRecipes');
            }, icon: const Icon(Icons.bookmark))
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: 16.0,
              ).copyWith(bottom: 100.0), // Added padding at the bottom
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter Ingredients:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'inter',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _ingredientController,
                          decoration: InputDecoration(
                            hintText: 'e.g., tomatoes, chicken, garlic...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add, color: ColorConstant.primary),
                        onPressed: () {
                          if (_ingredientController.text.isNotEmpty) {
                            setState(() {
                              _ingredients.add(_ingredientController.text);
                              _ingredientController.clear();
                            });
                          }
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstant.primarySoft,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: _fetchRecipe,
                          icon: SvgPicture.asset(
                            'assets/icons/ai-icon.svg',
                            height: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: _ingredients.map((ingredient) {
                      return Chip(
                        label: Text(ingredient),
                        deleteIcon: const Icon(Icons.close, size: 18),
                        onDeleted: () {
                          setState(() {
                            _ingredients.remove(ingredient);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Your Recipe:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter',
                        ),
                      ),
                      IconButton(
                        onPressed: _saveRecipe,
                        icon: _isSaved
                            ? const Icon(Icons.bookmark)
                            : const Icon(Icons.bookmark_add_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _showRecipe && _recipe != null
                          ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              _recipe!.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'inter',
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text('Ingredients:',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            ..._recipe!.ingredients
                                .map((ingredient) => Padding(
                              padding:
                              const EdgeInsets.symmetric(
                                  vertical: 4.0),
                              child: Text(
                                '${ingredient.name}: ${ingredient.quantity}',
                                style: const TextStyle(
                                    fontSize: 16),
                              ),
                            )),
                            const SizedBox(height: 16),
                            const Text('Instructions:',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            ..._recipe!.instructions
                                .map((instruction) => Padding(
                              padding:
                              const EdgeInsets.symmetric(
                                  vertical: 4.0),
                              child: Text(
                                instruction,
                                style: const TextStyle(
                                    fontSize: 16),
                              ),
                            )),
                            const SizedBox(height: 16),
                            const Text('Nutrition:',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              'Calories: ${_recipe!.nutrition.calories}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Protein: ${_recipe!.nutrition.protein}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Fat: ${_recipe!.nutrition.fat}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Carbohydrates: ${_recipe!.nutrition.carbohydrates}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Total Time: ${_recipe!.totalTime} minutes',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Servings: ${_recipe!.servings}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )
                          : const Center(
                          child: Text('No recipe generated yet.')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
