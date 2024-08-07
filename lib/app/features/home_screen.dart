import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:cook_book_ai/app/core/models/recipe.dart';
import 'package:cook_book_ai/app/core/utils/recipe_helper.dart';
import 'package:cook_book_ai/app/core/widgets/custom_app_bar.dart';
import 'package:cook_book_ai/app/core/widgets/custom_search_bar.dart';
import 'package:cook_book_ai/app/core/widgets/featured_recipe_card.dart';
import 'package:cook_book_ai/app/core/widgets/recipe_tile.dart';
import 'package:cook_book_ai/app/core/widgets/recommendation_recipe_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Recipe> featuredRecipe = RecipeHelper.getFeaturedRecipes();
    final List<Recipe> recommendationRecipe =
        RecipeHelper.getRecommendationRecipes();
    final List<Recipe> newlyPostedRecipe = RecipeHelper.getNewlyPostedRecipes();
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(
          'Hungry?',
          style: TextStyle(
              fontFamily: 'inter',
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        showProfilePhoto: true,
        profilePhoto: const AssetImage('assets/images/pp.png'),
        profilePhotoOnPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 350,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: 245,
                      color: ColorConstant.primary,
                    ),
                    Column(
                      children: [
                        CustomSearchBar(
                          routeTo: () {
                            Navigator.pushNamed(context, '/search');
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Delicious Today',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'inter'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/deliciousToday');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                child: const Text(
                                  'see all',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 220,
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: featuredRecipe.length,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 16,
                              );
                            },
                            itemBuilder: (context, index) {
                              return FeaturedRecipeCard(
                                  data: featuredRecipe[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Text(
                      'Today recommendation based on your taste...',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 174,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendationRecipe.length,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 16);
                      },
                      itemBuilder: (context, index) {
                        return RecommendationRecipeCard(
                            data: recommendationRecipe[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 14),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Newly Posted',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'inter'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/newlyPosted');
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14)),
                        child: const Text(
                          'see all',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    itemBuilder: (context, index) {
                      return RecipeTile(
                        data: newlyPostedRecipe[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
