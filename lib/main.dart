import "package:cook_book_ai/app/core/utils/hive_utils.dart";
import "package:cook_book_ai/app/core/widgets/page_switcher.dart";
import "package:cook_book_ai/app/features/auth/login_screen.dart";
import "package:cook_book_ai/app/features/auth/register_screen.dart";
import "package:cook_book_ai/app/features/delicious_today_screen.dart";
import "package:cook_book_ai/app/features/newly_posted_screen.dart";
import "package:cook_book_ai/app/features/profile_screen.dart";
import "package:cook_book_ai/app/features/saved_recipes_screen.dart";
import "package:cook_book_ai/app/features/search_screen.dart";
import "package:flutter/material.dart";
import "app/features/welcome_screen.dart";

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Open Sans',
        scaffoldBackgroundColor: Colors.white,
      ),
      home:const WelcomeScreen() ,
      routes: {
        '/register': (context) => const RegisterScreen(), // Assuming you have a RegisterScreen
        '/login': (context) => const LoginScreen(),
        '/profile':(context)=> const ProfileScreen(),
        '/pageSwitcher':(context)=> const PageSwitcher(),
        '/search':(context)=> const SearchScreen(),
        '/deliciousToday':(context) => DeliciousTodayScreen(),
        '/newlyPosted':(context)=> NewlyPostedScreen(),
        '/savedRecipes':(context)=>const SavedRecipesScreen()
        // '/recipeDetail':(context)=> RecipeDetailScreen(data: data),
        // Add more routes as needed
      },
    );
  }
}


