import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:cook_book_ai/app/core/models/recipe.dart';
import 'package:cook_book_ai/app/core/utils/recipe_helper.dart';
import 'package:cook_book_ai/app/core/widgets/category_card.dart';
import 'package:cook_book_ai/app/core/widgets/popular_recipe_card.dart';
import 'package:cook_book_ai/app/core/widgets/recommendation_recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatelessWidget {
  final Recipe popularRecipe = RecipeHelper.getPopularRecipe();
  final List<Recipe> sweetFoodRecommendationRecipe = RecipeHelper.getSweetFoodRecommendationRecipes();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primary,
        // brightness: Brightness.dark,
        elevation: 0,
        centerTitle: false,
        title: const Text('Explore Recipes', style: TextStyle(fontFamily: 'inter', fontWeight: FontWeight.w400, fontSize: 16,color: Colors.white)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
            icon: SvgPicture.asset('assets/icons/search.svg', color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Category
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: MediaQuery.of(context).size.width,
            height: 245,
            color: ColorConstant.primary,
            child: const Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CategoryCard(title: 'Healthy', image: AssetImage('assets/images/healthy.jpg')),
                CategoryCard(title: 'Drink', image: AssetImage('assets/images/drink.jpg')),
                CategoryCard(title: 'Seafood', image: AssetImage('assets/images/seafood.jpg')),
                CategoryCard(title: 'Desert', image: AssetImage('assets/images/desert.jpg')),
                CategoryCard(title: 'Spicy', image: AssetImage('assets/images/spicy.jpg')),
                CategoryCard(title: 'Meat', image: AssetImage('assets/images/meat.jpg')),
              ],
            ),
          ),
          // Section 2 - Popular Card
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: PopularRecipeCard(
              data: popularRecipe,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text(
                    'Todays sweet food to make your day happy ......',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                // Content
                Container(
                  height: 174,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: sweetFoodRecommendationRecipe.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return RecommendationRecipeCard(data: sweetFoodRecommendationRecipe[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
