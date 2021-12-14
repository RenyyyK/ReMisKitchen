import 'package:flutter/material.dart';
import 'package:remi_kitchen/authentication/auth_screen.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/widgets/app_drawer.dart';
import 'package:remi_kitchen/widgets/recipe_box.dart';
import './dummy_data.dart';

List<Recipe> availableRecipes = DUMMY_MEALS;

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            const Icon(Icons.search),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.favorite),
            ),
            IconButton(
              icon: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              },
            ),
          ],
          backgroundColor: const Color(0xffa4dfa7),
        ),
        drawer: AppDrawer(),
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
                  );
                },
                itemCount: availableRecipes.length,
              )
            )
          ],
        ));
  }
}
