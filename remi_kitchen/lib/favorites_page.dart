import 'package:flutter/material.dart';
import 'package:remi_kitchen/home_page.dart';
import 'package:remi_kitchen/main.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/widgets/app_drawer.dart';
import 'package:remi_kitchen/widgets/recipe_box.dart';

import 'authentication/auth_screen.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = '/favorites-recipes';

  final List<Recipe> favoriteRecipes;
  final Function toggleFavorite;
  final Function isFavorite;

  FavoritesPage(this.favoriteRecipes, this.toggleFavorite, this.isFavorite);

  void goHome(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(HomePage.routeName);
  }

  void goToAuth(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    if(favoriteRecipes.isEmpty){
      return Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColorLight,
          actions: [
            Icon(Icons.search),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              icon: Icon(Icons.home),
              onPressed: () => goHome(context),
            ),
            IconButton(
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              onPressed: () => goToAuth(context),
            ),
          ],
        ),
        drawer: AppDrawer(),
        backgroundColor: Theme.of(context).primaryColorLight,
        body: Center(
            child: RichText(
          text: TextSpan(
            text: "You don't have any favorites yet! ",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )));
    }
    return  Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColorLight,
          actions: [
            Icon(Icons.search),
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              icon: Icon(Icons.home),
              onPressed: () => goHome(context),
            ),
            IconButton(
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
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
                title: favoriteRecipes[index].title,
                imageUrl: favoriteRecipes[index].imageUrl,
                complexity: favoriteRecipes[index].complexity,
                duration: favoriteRecipes[index].duration,
                id: favoriteRecipes[index].id,
                calories: favoriteRecipes[index].calories,
                toggleFavorite: toggleFavorite,
                isFavorite: isFavorite(favoriteRecipes[index].id),
              );
            },
            itemCount: favoriteRecipes.length,
          ))
        ],
      ),);
  }
}
