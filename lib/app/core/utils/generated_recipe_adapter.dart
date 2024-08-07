import 'package:hive/hive.dart';

part 'generated_recipe_adapter.g.dart';

@HiveType(typeId: 0)
class GeneratedRecipe extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<Ingredient> ingredients;

  @HiveField(2)
  final List<String> instructions;

  @HiveField(3)
  final Nutrition nutrition;

  @HiveField(4)
  final int totalTime;

  @HiveField(5)
  final int servings;

  GeneratedRecipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.nutrition,
    required this.totalTime,
    required this.servings,
  });
}

@HiveType(typeId: 1)
class Ingredient {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });
}

@HiveType(typeId: 2)
class Nutrition {
  @HiveField(0)
  final int calories;

  @HiveField(1)
  final int protein;

  @HiveField(2)
  final int fat;

  @HiveField(3)
  final int carbohydrates;

  Nutrition({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  });
}
