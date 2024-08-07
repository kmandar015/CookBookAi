class Recipe {
  final String title;
  final String photo;
  final String calories;
  final String time;
  final String description;
  final List<Ingredient> ingredients;
  final List<TutorialStep> tutorial;
  final List<Review> reviews;

  Recipe({
    required this.title,
    required this.photo,
    required this.calories,
    required this.time,required this.description,
    required this.ingredients,
    required this.tutorial,
    this.reviews = const [],
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'] as String? ?? '', // Default to empty string if missing
      photo: json['photo'] as String? ?? 'assets/images/placeholder.png', // Default image
      calories: (json['calories'] as String?) ?? '0.0',
      time: (json['time'] as String) ?? '0',
      description: json['description'] as String? ?? '',
      ingredients: Ingredient.toList(json['ingredients'] as List? ?? []), // Handle missing ingredients
      tutorial: TutorialStep.toList(json['tutorial'] as List? ?? []), // Handle missing tutorial steps
      reviews: Review.toList(json['reviews'] as List? ?? []),
    );
  }
}

class TutorialStep {
  final String step;
  final String description;

  TutorialStep({required this.step, required this.description});

  factory TutorialStep.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('step') || !json.containsKey('description')) {
      throw ArgumentError('Missing required fields in tutorial step JSON.');
    }

    return TutorialStep(
      step: json['step'] ?? '',
      description: json['description'] ?? '',
    );
  }static List<TutorialStep> toList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TutorialStep.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

class Review {
  final String username;
  final String review;

  Review({required this.username, required this.review});

  factory Review.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('username') || !json.containsKey('review')) {
      throw ArgumentError('Missing required fields in review JSON.');
    }

    return Review(
      username: json['username'] ?? '',
      review: json['review'] ?? '',
    );
  }

  static List<Review> toList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => Review.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

class Ingredient {
  final String name;
  final String size;

  Ingredient({required this.name, required this.size});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('name') || !json.containsKey('size')) {
      throw ArgumentError('Missing required fields in ingredient JSON.');
    }

    return Ingredient(
      name: json['name'] ?? '',
      size: json['size'] ?? '',
    );
  }

  static List<Ingredient> toList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => Ingredient.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}