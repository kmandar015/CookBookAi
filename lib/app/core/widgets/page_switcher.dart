import 'package:cook_book_ai/app/core/constants/color_constant.dart';
import 'package:cook_book_ai/app/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:cook_book_ai/app/features/recipe_builder_screen.dart';
import 'package:cook_book_ai/app/features/bookmark_screen.dart';
import 'package:cook_book_ai/app/features/explore_screen.dart';
import 'package:cook_book_ai/app/features/home_screen.dart';
import 'package:flutter/material.dart';

class PageSwitcher extends StatefulWidget {
  const PageSwitcher({super.key});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                const HomeScreen(),
                ExploreScreen(),
                const BookmarkScreen(),
                const RecipeBuilderScreen(),
              ],
            ),
            const BottomGradientWidget(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: _onItemTapped,
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();super.dispose();
  }
}

class BottomGradientWidget extends StatelessWidget {
  const BottomGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ClipRect( // Use ClipRect for optimization
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
            gradient: ColorConstant.bottomShadow,
          ),
        ),
      ),
    );
  }
}