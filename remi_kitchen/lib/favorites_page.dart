import 'package:flutter/material.dart';
import 'package:remi_kitchen/home_page.dart';
import 'package:remi_kitchen/main.dart';
import 'package:remi_kitchen/models/ingredient.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/providers/auth.dart';
import 'package:remi_kitchen/widgets/app_drawer.dart';
import 'package:remi_kitchen/widgets/logout-dialog.dart';
import 'package:remi_kitchen/widgets/recipe_box.dart';

import 'authentication/auth_screen.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = '/favorites-recipes';

  final List<Recipe> favoriteRecipes;
  final List<Ingredient> ingredients;
  final Function toggleFavorite;
  final Function isFavorite;
  final Function saveFilters;
  final Function clearFilters;
  final Map<String, bool> isChecked;
  final Auth auth;
  

  FavoritesPage(this.favoriteRecipes, this.ingredients, this.toggleFavorite, this.isFavorite,this.saveFilters, this.clearFilters, this.isChecked, this.auth);

  void goHome(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(HomePage.routeName);
  }

  void goToAuth(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AuthScreen.routeName);
  }

  void logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
        LogoutDialog(auth: auth,),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(favoriteRecipes.isEmpty){
      return Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColorLight,
          actions: [
            // Icon(Icons.search),
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
              onPressed: () => auth.isAuth ? logout(context) : goToAuth(context),
            ),
          ],
        ),
        drawer: AppDrawer(ingredients: ingredients, saveFilters: saveFilters, clearFilters: clearFilters, isChecked: isChecked, ),
        backgroundColor: Theme.of(context).primaryColorLight,
        body: Stack(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/wallpaper.png"),
                  fit: BoxFit.cover
                ),
              )
            ),
        
        
            Center(
              child: RichText(
                text: TextSpan(
                  text: "You don't have any favorites yet! ",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),

          ],
        ), 
      );
    }
    return  Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColorLight,
          actions: [
            // Icon(Icons.search),
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
              onPressed: () => auth.isAuth ? logout(context) : goToAuth(context),
            ),
          ],
        ),
        drawer: AppDrawer(ingredients: ingredients, saveFilters: saveFilters, clearFilters: clearFilters,isChecked: isChecked,),
        backgroundColor: Theme.of(context).primaryColorLight,
        body: Stack(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/wallpaper.png"),
                  fit: BoxFit.cover
                ),
              )
            ),
        
        
        
            Column(
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
                      ingredients: favoriteRecipes[index].ingredients,
                      steps: favoriteRecipes[index].steps,
                      isGlutenFree: favoriteRecipes[index].isGlutenFree,
                      isLactoseFree: favoriteRecipes[index].isLactoseFree,
                      auth: auth,
                    );
                  },
                  itemCount: favoriteRecipes.length,
                ))
              ],
            ),

          ]
        )
      );
  }
}
