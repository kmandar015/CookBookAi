import 'dart:convert';
import 'package:cook_book_ai/app/core/constants/string_constant.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> generateRecipe(List<String> ingredients) async {
  final prompt = '''
Generate a detailed recipe including the following information: 
1. Recipe name
2. List of ingredients with quantities
3. Step-by-step cooking instructions
4. Nutrition values (calories, protein, fat, carbohydrates, etc.)
5. Total cooking time
6. Number of servings

Format the response in JSON as follows:
{
  "name": "Recipe Name",
  "ingredients": [
    {"name": "ingredient1", "quantity": "amount"},
    {"name": "ingredient2", "quantity": "amount"}
  ],
  "instructions": [
    "Step 1: ...",
    "Step 2: ..."
  ],
  "nutrition": {
    "calories": "amount",
    "protein": "amount",
    "fat": "amount",
    "carbohydrates": "amount"
  },
  "totalTime": "time in minutes",
  "servings": "number of servings"
}

Ingredients are as follows:
${ingredients.join('\n')}
''';

  final response = await http.post(
    Uri.parse(StringConstant.apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'contents': [
        {
          'role': 'user',
          'parts': [
            {
              'text': prompt,
            },
          ],
        },
      ],
      'generationConfig': {
        'temperature': 1.5,
        'topK': 64,
        'topP': 0.95,
        'maxOutputTokens': 8192,
        'responseMimeType': 'application/json',
      },
    }),
  );

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final candidates = jsonResponse['candidates'] as List;
    if (candidates.isNotEmpty) {
      final content = candidates[0]['content'] as Map<String, dynamic>;
      final parts = content['parts'] as List;
      if (parts.isNotEmpty) {
        final text = parts[0]['text'] as String;
        return jsonDecode(text);
      }
    }
    throw Exception('No valid recipe data found in the response');
  } else {
    throw Exception('Failed to generate recipe');
  }
}
