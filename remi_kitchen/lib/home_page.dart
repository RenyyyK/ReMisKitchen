import 'package:flutter/material.dart';
import 'package:remi_kitchen/authentication/auth_screen.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/recipe_page.dart';
import 'package:remi_kitchen/widgets/pages_menu.dart';
import 'package:remi_kitchen/widgets/recipe_box.dart';
import './dummy_data.dart';

List<Recipe> availableRecipes = DUMMY_MEALS;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Icon(Icons.search),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.favorite),
            ),
            IconButton(
              icon: Icon(
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
