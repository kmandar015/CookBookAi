class GeneratedRecipe {
  final String name;
  final List<GeneratedIngredient> ingredients;
  final List<String> instructions;
  final GeneratedNutrition nutrition;
  final String totalTime;
  final String servings;

  GeneratedRecipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.nutrition,
    required this.totalTime,
    required this.servings,
  });

  factory GeneratedRecipe.fromJson(Map<String, dynamic> json) {
    return GeneratedRecipe(
      name: json['name'],
      ingredients: (json['ingredients'] as List)
          .map((i) => GeneratedIngredient.fromJson(i))
          .toList(),
      instructions: List<String>.from(json['instructions']),
      nutrition: GeneratedNutrition.fromJson(json['nutrition']),
      totalTime: json['totalTime'],
      servings: json['servings'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ingredients': ingredients.map((i) => i.toJson()).toList(),
      'instructions': instructions,
      'nutrition': nutrition.toJson(),
      'totalTime': totalTime,
      'servings': servings,
    };
  }
}

class GeneratedIngredient {
  final String name;
  final String quantity;

  GeneratedIngredient({
    required this.name,
    required this.quantity,
  });

  factory GeneratedIngredient.fromJson(Map<String, dynamic> json) {
    return GeneratedIngredient(
      name: json['name'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }
}

class GeneratedNutrition {
  final String calories;
  final String protein;
  final String fat;
  final String carbohydrates;

  GeneratedNutrition({
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrates,
  });

  factory GeneratedNutrition.fromJson(Map<String, dynamic> json) {
    return GeneratedNutrition(
      calories: json['calories'],
      protein: json['protein'],
      fat: json['fat'],
      carbohydrates: json['carbohydrates'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbohydrates': carbohydrates,
    };
  }
}
