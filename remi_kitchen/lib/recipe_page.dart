import 'package:flutter/material.dart';
import 'package:remi_kitchen/models/recipe.dart';
import 'package:remi_kitchen/models/step.dart';
import 'package:remi_kitchen/widgets/my_flutter_app_icons.dart';
import 'models/measurement.dart';

class RecipePage extends StatelessWidget {
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

  Map<String, bool?> checkboxes = {};

  RecipePage({
    required this.title,
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
    required this.isLactoseFree
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

  void adjustIngredients() {}

  Widget getIngredients(context) {
    List<Widget> list = [];
    for(Measurement i in ingredients){
        list.add(Row(
          children: <Widget>[
            Checkbox(
              value: checkboxes["i.ingredient.id"],
              onChanged: (bool? value) {
                setState(() {
                  checkboxes["i.ingredient.id"] = value;
                });
              },
            ),
            Text(i.ingredient.unitOfMeasurement.name != 'None' ? (i.ingredient.unitOfMeasurement.name == 'Unit'? i.quantity.toInt().toString() + " " : i.quantity.toString() + " ") : "", 
              style: TextStyle(color: Theme.of(context).shadowColor),
            ),
            Text(i.ingredient.unitOfMeasurement.name != 'None' && i.ingredient.unitOfMeasurement.name != 'Unit' ? i.ingredient.unitOfMeasurement.name + "   " : "",
              style: TextStyle(color: Theme.of(context).shadowColor),
            ),
            Text(i.ingredient.name + " ",
              style: TextStyle(
                color: Theme.of(context).shadowColor,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(i.extraDetails != '' ? "(" + i.extraDetails + ")" : "",
              style: TextStyle(color: Theme.of(context).shadowColor),
            ),
          ]
        ));
    }
    return new Column(children: list);
  }

  Widget getSteps(context) {
    List<Widget> list = [];
    for(RecipeStep s in steps){
        list.add(Column(
          children: <Widget>[
            Text("Step " + s.number.toString(), 
              style: TextStyle(
                color: Theme.of(context).shadowColor,
                fontWeight: FontWeight.bold
              ),
            ),
            Text("Step " + s.description + "\n", 
              style: TextStyle(
                color: Theme.of(context).shadowColor
              ),
            ),
          ]
        ));
    }
    return new Column(children: list);
  }
  
  @override
  Widget build(BuildContext context) {
    for (Measurement i in ingredients) {
      checkboxes["i.ingredient.id"] = false;
    }

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
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: Expanded(
            child: Stack(
              children: <Widget>[
                Column(children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        // borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image.network(
                          imageUrl,
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                          isFavorite ? Icons.favorite : MyFlutterApp.love,
                                          color: Theme.of(context).primaryColorLight,
                                        ),
                                        onPressed: () => {toggleFavorite(id)},
                                        iconSize: 30,
                                      ),
                                    ]
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
                                ),
                              ],
                            )),
                      ),
                      // Positioned(
                      //   right: 0,
                      //   top: 0,
                      //   child: IconButton(
                      //     padding: EdgeInsets.symmetric(
                      //         vertical: 25, horizontal: 25),
                      //     icon: Icon(
                      //       isFavorite ? Icons.favorite : MyFlutterApp.love,
                      //       color: Theme.of(context).primaryColorLight,
                      //     ),
                      //     onPressed: () => {toggleFavorite(id)},
                      //     iconSize: 30,
                      //   ),
                      // ),
                    ],
                  ),
                ]),
                Positioned(
                  top: 300,
                  left: 15,
                  right: 15,
                  child: Container(
                    height: 500,
                    child: Card(
                      color: Theme.of(context).primaryColorLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Container(
                        padding: new EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(isGlutenFree ? "  Glutenfree" : "  Gluten",
                                      style: TextStyle(color: Theme.of(context).primaryColorDark),
                                    ),
                                    Text(isLactoseFree ? "  Lactosefree" : "  Lactose",
                                      style: TextStyle(color: Theme.of(context).primaryColorDark),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                RaisedButton(
                                  child: Text('Adjust Ingredients'),
                                  onPressed: adjustIngredients,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                                  color: Theme.of(context).primaryColorDark, 
                                  textColor: Theme.of(context).primaryColorLight,
                                ),
                              ],
                            ),
                            Text("\nINGREDIENTS:\n",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            getIngredients(context),
                            Text("\nSTEPS:\n",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            getSteps(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]
            )
          )
        )
    );
  }
}

void setState(Null Function() param0) {
}
