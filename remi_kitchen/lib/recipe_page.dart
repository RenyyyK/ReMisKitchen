import 'package:flutter/material.dart';
import 'package:remi_kitchen/favorites_page.dart';
import 'package:remi_kitchen/main.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/models/step.dart';
import 'package:remi_kitchen/providers/auth.dart';
import 'package:remi_kitchen/widgets/adjust_dialog.dart';
import 'package:remi_kitchen/widgets/logout-dialog.dart';
import 'package:remi_kitchen/widgets/my_flutter_app_icons.dart';
import 'authentication/auth_screen.dart';
import 'models/measurement.dart';

import 'widgets/popup_dialog.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState(
      title: title,
      imageUrl: imageUrl,
      complexity: complexity,
      duration: duration,
      id: id,
      calories: calories,
      toggleFavorite: toggleFavorite,
      isFavorite: isFavorite,
      ingredients: ingredients,
      steps: steps,
      isGlutenFree: isGlutenFree,
      isLactoseFree: isLactoseFree,
      auth: auth);

  static const routeName = '/recipe-page';

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final int calories;
  final Function toggleFavorite;
  final bool isFavorite;
  final List<Measurement> ingredients;
  final List<RecipeStep> steps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final Auth auth;

  RecipePage(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.calories,
      required this.toggleFavorite,
      required this.isFavorite,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.auth});
}

class _RecipePageState extends State<RecipePage> {
  // static const routeName = '/recipe-page';

  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final int calories;
  final Function toggleFavorite;
  late final bool isFavorite;
  final List<Measurement> ingredients;
  final List<RecipeStep> steps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final Auth auth;

  late var isFavoriteVariable = isFavorite;
  late Map<String, double?> adjustedIngredients = Map.fromIterable(ingredients.where((element) => element.ingredient.unitOfMeasurement.name != 'None'), key: (e) => e.ingredient.id, value: (e) => e.quantity);
  late Map<String, bool?> checkboxes = Map.fromIterable(ingredients, key: (e) => e.ingredient.id, value: (e) => false);
  late Map<int, bool?> checksteps = Map.fromIterable(steps, key: (e) => e.number, value: (e) => false);

  _RecipePageState(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.calories,
      required this.toggleFavorite,
      required this.isFavorite,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.auth});

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

  void tapOnStep(number) {
      for(var k in checksteps.keys) {
          checksteps[k] = false;
      }
      checksteps[number] = true;
  }

  void adjustIngredients(id, oldQuantity, newQuantity) {
    var percent = oldQuantity / newQuantity;
    setState(() {
      adjustedIngredients[id] = newQuantity;
      for(var k in adjustedIngredients.keys) {
        if(k != id) {
            adjustedIngredients[k] = adjustedIngredients[k]! / percent;
        }
      }
    });
    
  }

  Widget getIngredients(context) {
    List<Widget> list = [];
    for (Measurement i in ingredients) {
      if (i.ingredient.unitOfMeasurement.name == 'None') {
        list.add(Row(children: <Widget>[
          Checkbox(
            value: checkboxes[i.ingredient.id],
            onChanged: (value) {
              setState(() {
                checkboxes[i.ingredient.id] = value;
              });
            },
          ),
          Text(
            i.ingredient.name + " ",
            style: TextStyle(
                color: Theme.of(context).shadowColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            i.extraDetails != '' ? "(" + i.extraDetails + ")" : "",
            style: TextStyle(color: Theme.of(context).shadowColor),
          ),
        ]));
      } else {
        list.add(Row(children: <Widget>[
          Checkbox(
            value: checkboxes[i.ingredient.id],
            onChanged: (value) {
              setState(() {
                checkboxes[i.ingredient.id] = value;
              });
            },
          ),
          InkWell(
            onTap: () async {
              var newQuantity = await showDialog(
                context: context,
                builder: (BuildContext context) =>
                    AdjustDialog(i, adjustedIngredients[i.ingredient.id]),
              );
              adjustIngredients(i.ingredient.id, adjustedIngredients[i.ingredient.id], newQuantity);
            },
            child: Row(
              children: <Widget>[
                Text(
                  i.ingredient.unitOfMeasurement.name == 'Unit'
                      ? adjustedIngredients[i.ingredient.id]!.toInt().toString() + " "
                      : adjustedIngredients[i.ingredient.id].toString() + " ",
                  style: TextStyle(color: Theme.of(context).shadowColor),
                ),
                Text(
                  i.ingredient.unitOfMeasurement.name != 'Unit'
                      ? i.ingredient.unitOfMeasurement.name + "   "
                      : "",
                  style: TextStyle(color: Theme.of(context).shadowColor),
                ),
                Text(
                  i.ingredient.name + " ",
                  style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  i.extraDetails != '' ? "(" + i.extraDetails + ")" : "",
                  style: TextStyle(color: Theme.of(context).shadowColor),
                ),
              ],
            ),
          ),
        ]));
      }
    }
    return Column(children: list);
  }

  Widget getSteps(context) {
    List<Widget> list = [];
    for (RecipeStep s in steps) {
      list.add(Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
            color: checksteps[s.number] == true
                ? Theme.of(context).primaryColor
                : Theme.of(context).primaryColorLight,
            child: InkWell(
                onTap: () {
                  setState(() {
                    tapOnStep(s.number);
                  });
                },
                child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Step " + s.number.toString(),
                            style: TextStyle(
                                color: Theme.of(context).shadowColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            s.description + "",
                            style:
                                TextStyle(color: Theme.of(context).shadowColor),
                          ),
                        ])))),
      ));
    }
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(children: list));
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
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColorLight,
          actions: [
            // const Icon(Icons.search),
            IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                icon: const Icon(Icons.favorite),
                onPressed: () => Navigator.of(context).pushNamed(
                    FavoritesPage.routeName,
                    arguments: [favoriteRecipes, toggleFavorite, isFavorite])),
            IconButton(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Theme.of(context).primaryColorLight,
              ),
              onPressed: () => auth.isAuth ? logout(context) : goToAuth(context),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 900,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
            ListView(
              children: [
                Stack(
                  children: [
                    Image.network(
                      imageUrl,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 0,
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
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                          text: title,
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        textAlign: TextAlign.left,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        maxLines: 2,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          isFavoriteVariable
                                              ? Icons.favorite
                                              : MyFlutterApp.love,
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                        ),
                                        onPressed: () => setState(() {
                                          isFavoriteVariable
                                              ? isFavoriteVariable = false
                                              : isFavoriteVariable = true;
                                          toggleFavorite(id);
                                        }),
                                        iconSize: 30,
                                      ),
                                    ]),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
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
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
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
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
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
                              ),
                            ],
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 300, 15, 20),
                      child: Card(
                        color: Theme.of(context)
                            .primaryColorLight
                            .withOpacity(0.95),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: new EdgeInsets.all(15.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            isGlutenFree
                                                ? "  Glutenfree"
                                                : "  Gluten",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColorDark),
                                          ),
                                          Text(
                                            isLactoseFree
                                                ? "  Lactosefree"
                                                : "  Lactose",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColorDark),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: new EdgeInsets.all(15.0),
                                      child: RaisedButton(
                                        child: Text('Adjust Ingredients'),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                PopupDialog(),
                                          );
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 8.0),
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        textColor:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "\n\nINGREDIENTS:",
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                getIngredients(context),
                                Text(
                                  "\nDIRECTIONS:\n",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                getSteps(context),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container()
              ],
            )
          ],
        ));
  }
}
