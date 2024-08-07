import 'package:cook_book_ai/app/core/utils/generated_recipe_adapter.dart';
import 'package:hive_flutter/adapters.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  HiveService._internal();

  Box<GeneratedRecipe>? _recipeBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(GeneratedRecipeAdapter());
    Hive.registerAdapter(IngredientAdapter());
    Hive.registerAdapter(NutritionAdapter());
    _recipeBox = await _openRecipeBox();
  }

  Future<Box<GeneratedRecipe>> _openRecipeBox() async {
    if (!Hive.isBoxOpen('recipes')) {
      return await Hive.openBox<GeneratedRecipe>('recipes');
    }
    return Hive.box<GeneratedRecipe>('recipes');
  }

  Box<GeneratedRecipe>? get recipeBox => _recipeBox;
}
