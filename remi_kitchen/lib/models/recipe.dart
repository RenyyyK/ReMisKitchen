// ignore_for_file: constant_identifier_names

import 'package:remi_kitchen/models/measurement.dart';

enum Complexity { Simple, Challenging, Hard }

class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final List<Measurement> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final int calories;

  const Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.complexity,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.calories,
  });
}
