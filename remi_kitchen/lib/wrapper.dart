import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remi_kitchen/authentication/auth_screen.dart';
import 'package:remi_kitchen/home_page.dart';
import 'package:remi_kitchen/models/appuser.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/models/ingredient.dart';

class Wrapper extends StatelessWidget {
  final List<Recipe> availableRecipes;
  final List<Recipe> favoriteRecipes;
  final List<Ingredient> ingredients;
  final Function toggleFavorite;
  final Function isFavorite;
  final Function saveFilters;
  final Function clearFilters;
  final Map<String, bool> isChecked;

  Wrapper(
      this.favoriteRecipes,
      this.availableRecipes,
      this.ingredients,
      this.toggleFavorite,
      this.isFavorite,
      this.saveFilters,
      this.clearFilters,
      this.isChecked);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return AuthScreen();
    } else {
      return HomePage(favoriteRecipes, availableRecipes, ingredients,
          toggleFavorite, isFavorite, saveFilters, clearFilters, isChecked);
    }
  }
}
