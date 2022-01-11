import 'package:flutter/material.dart';
import 'package:remi_kitchen/authentication/auth_screen.dart';
import 'package:remi_kitchen/favorites_page.dart';
import 'package:remi_kitchen/models/ingredient.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/services/auth.dart';
import 'package:remi_kitchen/widgets/app_drawer.dart';
import 'package:remi_kitchen/widgets/recipe_box.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  final List<Recipe> availableRecipes;
  final List<Recipe> favoriteRecipes;
  final List<Ingredient> ingredients;
  final Function toggleFavorite;
  final Function isFavorite;
  final Function saveFilters;
  final Function clearFilters;
  final Map<String, bool> isChecked;
 

  HomePage(this.favoriteRecipes, this.availableRecipes, this.ingredients, this.toggleFavorite, this.isFavorite, this.saveFilters,this.clearFilters, this.isChecked);

  void goToFavorites(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(FavoritesPage.routeName, arguments: [favoriteRecipes,toggleFavorite, isFavorite]);
  }

  void goToAuth(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AuthScreen.routeName);
  }

  
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColorLight,
        actions: [
          const Icon(Icons.search),
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            icon: const Icon(Icons.favorite),
            onPressed: () => goToFavorites(context),
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Theme.of(context).primaryColorLight,
            ),
            //onPressed: () => goToAuth(context),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      drawer: AppDrawer(ingredients: ingredients, saveFilters: saveFilters, clearFilters: clearFilters, isChecked: isChecked,),
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) {
              return RecipeBox(
                title: availableRecipes[index].title,
                imageUrl: availableRecipes[index].imageUrl,
                complexity: availableRecipes[index].complexity,
                duration: availableRecipes[index].duration,
                id: availableRecipes[index].id,
                calories: availableRecipes[index].calories,
                toggleFavorite: toggleFavorite,
                isFavorite: isFavorite(availableRecipes[index].id),
                ingredients: availableRecipes[index].ingredients,
                steps: availableRecipes[index].steps,
                isGlutenFree: availableRecipes[index].isGlutenFree,
                isLactoseFree: availableRecipes[index].isLactoseFree
              );
            },
            itemCount: availableRecipes.length,
          ))
        ],
      ),
    );
  }
}
