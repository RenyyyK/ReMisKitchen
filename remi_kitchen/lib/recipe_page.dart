import 'package:flutter/material.dart';
import 'package:remi_kitchen/models/recipe.dart';

class RecipePage extends StatelessWidget {
  static const routeName = '/recipe-page';
  final Function toggleFavorite;

  RecipePage(this.toggleFavorite);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColorLight,
          actions: [
            Icon(Icons.search, color: Theme.of(context).primaryColorLight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.favorite,
                  color: Theme.of(context).primaryColorLight),
            ),
            Icon(Icons.account_circle_outlined,
                color: Theme.of(context).primaryColorLight),
          ],
        ),
        body: Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'Reciepe 1',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            IconButton(
            icon: Icon(Icons.favorite),
            onPressed:() => toggleFavorite,)
          ],
        ));
  }
}
