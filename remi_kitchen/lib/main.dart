import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remi_kitchen/authentication/auth_screen.dart';
import 'package:remi_kitchen/favorites_page.dart';

import 'package:remi_kitchen/home_page.dart';
import 'package:remi_kitchen/models/ingredient.dart';
import 'package:remi_kitchen/models/measurement.dart';
import 'package:remi_kitchen/providers/auth.dart';

import 'dummy_data.dart';
import 'models/recipe.dart';

List<Recipe> availableRecipes = DUMMY_MEALS;
List<Ingredient> ingredients = DUMMY_INGREDIENTS;
List<Recipe> favoriteRecipes = [];
Map<String, bool> isChecked = {};
void main() {
  ingredients.sort((a, b) => a.name.compareTo(b.name));
  ingredients.forEach((val) {
    isChecked.addAll({val.id: false});
  });
  runApp(RemisKitchen());
}

class RemisKitchen extends StatefulWidget {
  @override
  State<RemisKitchen> createState() => _RemisKitchenState();
}

class _RemisKitchenState extends State<RemisKitchen> {
  Map<int, Color> celadon = {
    //A4DFA7
    50: const Color.fromRGBO(164, 223, 167, .1),
    100: const Color.fromRGBO(164, 223, 167, .2),
    200: const Color.fromRGBO(164, 223, 167, .3),
    300: const Color.fromRGBO(164, 223, 167, .4),
    400: const Color.fromRGBO(164, 223, 167, .5),
    500: const Color.fromRGBO(164, 223, 167, .6),
    600: const Color.fromRGBO(164, 223, 167, .7),
    700: const Color.fromRGBO(164, 223, 167, .8),
    800: const Color.fromRGBO(164, 223, 167, .9),
    900: const Color.fromRGBO(164, 223, 167, 1),
  };

  Map<int, Color> copper = {
    //B57F50
    50: const Color.fromRGBO(181, 127, 80, .1),
    100: const Color.fromRGBO(181, 127, 80, .2),
    200: const Color.fromRGBO(181, 127, 80, .3),
    300: const Color.fromRGBO(181, 127, 80, .4),
    400: const Color.fromRGBO(181, 127, 80, .5),
    500: const Color.fromRGBO(181, 127, 80, .6),
    600: const Color.fromRGBO(181, 127, 80, .7),
    700: const Color.fromRGBO(181, 127, 80, .8),
    800: const Color.fromRGBO(181, 127, 80, .9),
    900: const Color.fromRGBO(181, 127, 80, 1),
  };

  Map<int, Color> forest = {
    //04471C
    50: const Color.fromRGBO(4, 71, 28, .1),
    100: const Color.fromRGBO(4, 71, 28, .2),
    200: const Color.fromRGBO(4, 71, 28, .3),
    300: const Color.fromRGBO(4, 71, 28, .4),
    400: const Color.fromRGBO(4, 71, 28, .5),
    500: const Color.fromRGBO(4, 71, 28, .6),
    600: const Color.fromRGBO(4, 71, 28, .7),
    700: const Color.fromRGBO(4, 71, 28, .8),
    800: const Color.fromRGBO(4, 71, 28, .9),
    900: const Color.fromRGBO(4, 71, 28, 1),
  };

  Map<int, Color> cultured = {
    //F7F3F3
    50: const Color.fromRGBO(245, 240, 246, .1),
    100: const Color.fromRGBO(245, 240, 246, .2),
    200: const Color.fromRGBO(245, 240, 246, .3),
    300: const Color.fromRGBO(245, 240, 246, .4),
    400: const Color.fromRGBO(245, 240, 246, .5),
    500: const Color.fromRGBO(245, 240, 246, .6),
    600: const Color.fromRGBO(245, 240, 246, .7),
    700: const Color.fromRGBO(245, 240, 246, .8),
    800: const Color.fromRGBO(245, 240, 246, .9),
    900: const Color.fromRGBO(245, 240, 246, 1),
  };

  Map<int, Color> fogra = {
    //080D08
    50: const Color.fromRGBO(8, 13, 8, .1),
    100: const Color.fromRGBO(8, 13, 8, .2),
    200: const Color.fromRGBO(8, 13, 8, .3),
    300: const Color.fromRGBO(8, 13, 8, .4),
    400: const Color.fromRGBO(8, 13, 8, .5),
    500: const Color.fromRGBO(8, 13, 8, .6),
    600: const Color.fromRGBO(8, 13, 8, .7),
    700: const Color.fromRGBO(8, 13, 8, .8),
    800: const Color.fromRGBO(8, 13, 8, .9),
    900: const Color.fromRGBO(8, 13, 8, 1),
  };

  void _setFilters(Map<String, bool> isChecked) {
    setState(() {
      Measurement none = const Measurement(
          ingredient: Ingredient(
              id: 'none',
              name: 'name',
              unitOfMeasurement: UnitOfMeasurement.None),
          quantity: 0,
          extraDetails: '');
      bool containsIngredient = false;

      availableRecipes = DUMMY_MEALS.where((recipe) {
        containsIngredient = false;
        isChecked.forEach((key, value) {
          if (value &&
              recipe.ingredients.firstWhere((measurement) {
                    if (measurement.ingredient.id.compareTo(key) == 0) {
                      return true;
                    }
                    return false;
                  }, orElse: () => none) !=
                  none) {
            containsIngredient = true;
            return;
          }
        });
        return containsIngredient;
      }).toList();
    });
  }

  void _clearFilters() {
    setState(() {
      availableRecipes = DUMMY_MEALS;
      ingredients.forEach((val) {
    isChecked.addAll({val.id: false});
  });
    });
  }

  void _toggleFavorites(String recipeId) {
    final existingIndex =
        favoriteRecipes.indexWhere((element) => element.id == recipeId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteRecipes.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteRecipes.add(
            availableRecipes.firstWhere((element) => element.id == recipeId));
      });
    }
  }

  bool _isFavorite(String recipeId) {
    return favoriteRecipes.any((element) => element.id == recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
 
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'RemisKitchen',
          home: auth.isAuth ? HomePage(
              favoriteRecipes,
              availableRecipes,
              ingredients,
              _toggleFavorites,
              _isFavorite,
              _setFilters,
              _clearFilters,
              isChecked, 
              auth) : AuthScreen(),
          theme: ThemeData(
              primarySwatch: MaterialColor(0xFFa4dfa7, celadon),
              primaryColorDark: MaterialColor(0xFFB57F50, copper),
              primaryColorLight: MaterialColor(0xFFf5f0f6, cultured),
              accentColor: MaterialColor(0xFF04471C, forest),
              shadowColor: MaterialColor(0xFF080D08, fogra),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                    fontFamily: "InriaSerif",
                    color: Color(0xFF080D08),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
                bodyText2: TextStyle(
                  fontFamily: "InriaSerif",
                  color: Color(0xFFF7F3F3),
                  fontSize: 17,
                ),
                button: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xFFF7F3F3),
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              )),
          // initialRoute: '/home',
          routes: {
            HomePage.routeName: (ctx) => HomePage(
                favoriteRecipes,
                availableRecipes,
                ingredients,
                _toggleFavorites,
                _isFavorite,
                _setFilters,
                _clearFilters,
                isChecked, 
                auth),
            FavoritesPage.routeName: (ctx) => FavoritesPage(
                favoriteRecipes,
                ingredients,
                _toggleFavorites,
                _isFavorite,
                _setFilters,
                _clearFilters,
                isChecked, 
                auth),
            AuthScreen.routeName: (ctx) => AuthScreen(),
          },
        )
      ),
    );
  }
}
