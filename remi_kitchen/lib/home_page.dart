import 'package:flutter/material.dart';
import 'package:remi_kitchen/authentication/auth_screen.dart';
import 'package:remi_kitchen/favorites_page.dart';
import 'package:remi_kitchen/main.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/widgets/app_drawer.dart';
import 'package:remi_kitchen/widgets/recipe_box.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  final List<Recipe> availableRecipes;
  final List<Recipe> favoriteRecipes;
  final Function toggleFavorite;
  final Function isFavorite;

  HomePage(this.favoriteRecipes, this.availableRecipes, this.toggleFavorite, this.isFavorite);

   void goToFavorites(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(FavoritesPage.routeName, arguments: [favoriteRecipes,toggleFavorite, isFavorite]);
  }

  void goToAuth(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            onPressed: () => goToAuth(context),
          ),
        ],
      ),
      drawer: AppDrawer(),
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
              );
            },
            itemCount: availableRecipes.length,
          ))
        ],
      ),
    );
  }
}
