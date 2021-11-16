// ignore_for_file: constant_identifier_names

enum Complexity { Simple, Challenging, Hard }

class Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final bool isGlutenFree;
  final bool isLactoseFree;

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
  });
}
