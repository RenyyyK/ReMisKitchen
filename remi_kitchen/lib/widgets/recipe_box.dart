// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:remi_kitchen/widgets/my_flutter_app_icons.dart';

import '../models/recipe.dart';
import '../recipe_page.dart';

class RecipeBox extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final int calories;
  final Function toggleFavorite;
  final bool isFavorite;

  RecipeBox({
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.calories,
    required this.toggleFavorite,
    required this.isFavorite,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Medium';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return RecipePage(toggleFavorite);
              }))
            },
        child: Container(
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image.network(
                          imageUrl,
                          height: 260,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 25),
                          icon: Icon(
                            isFavorite ? Icons.favorite : MyFlutterApp.love,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () => {toggleFavorite(id)},
                          iconSize: 30,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        height: 120,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              color: Theme.of(context)
                                  .primaryColorDark
                                  .withOpacity(0.8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    child: RichText(
                                      text: TextSpan(
                                        text: title,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      textAlign: TextAlign.left,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Icon(
                                                MyFlutterApp.clock__1__1,
                                                color: Theme.of(context)
                                                    .primaryColorLight,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text('$duration min'),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Icon(
                                                MyFlutterApp.chef_hat_1,
                                                color: Theme.of(context)
                                                    .primaryColorLight,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text('$complexityText'),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Icon(
                                                MyFlutterApp.calories_1,
                                                color: Theme.of(context)
                                                    .primaryColorLight,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text('$calories kcal'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ]))));
  }
}
