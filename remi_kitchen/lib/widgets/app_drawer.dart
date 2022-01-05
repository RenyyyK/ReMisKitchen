// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:remi_kitchen/main.dart';
import 'package:remi_kitchen/models/ingredient.dart';

class AppDrawer extends StatefulWidget {
  final List<Ingredient> ingredients;
  final Function saveFilters;
  final Function clearFilters;
  final Map<String, bool> isChecked;

  const AppDrawer(
      {Key? key,
      required this.ingredients,
      required this.saveFilters,
      required this.clearFilters,
      required this.isChecked})
      : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(92)),
      child: Drawer(
          backgroundColor: Theme.of(context).primaryColor,
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.82,
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 10),
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return Row(children: [
                              Checkbox(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value:
                                      widget.isChecked[widget.ingredients[index].id],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.isChecked[widget.ingredients[index].id] =
                                          value!;
                                    });
                                  }),
                              Text(
                                widget.ingredients[index].name,
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ]);
                          },
                          itemCount: widget.ingredients.length,
                        ))
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: () {
                            widget.saveFilters(widget.isChecked);
                            Navigator.of(context).pop();
                          },
                          backgroundColor: Theme.of(context).primaryColorDark,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Find Recipes',
                                style:
                                    TextStyle(fontSize: 10, shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 2.0,
                                  ),
                                ])),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80.0,
                      width: 80.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: () {
                            widget.clearFilters();
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Clear Filter',
                                style:
                                    TextStyle(fontSize: 10, shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 2.0,
                                  ),
                                ])),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
