import 'package:flutter/material.dart';
import 'package:remi_kitchen/authentication/signup_page.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/recipe_page.dart';
import 'package:remi_kitchen/widgets/pages_menu.dart';
import 'package:remi_kitchen/widgets/recipe_box.dart';

import 'authentication/login_page.dart';
import './dummy_data.dart';

List<Recipe> availableRecipes = DUMMY_MEALS;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Icon(Icons.search),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.favorite),
            ),
            Icon(Icons.account_circle_outlined),
          ],
          backgroundColor: const Color(0xffa4dfa7),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: PagesMenu(),
            ),
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
