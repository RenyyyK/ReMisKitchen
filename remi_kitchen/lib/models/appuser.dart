import 'package:remi_kitchen/models/recipe.dart';

class AppUser {

  final String uid;
  
  AppUser({ required this.uid });

}

class UserData {

  final String uid;
  final String name;
  final List<Recipe> favorites;

  UserData({ required this.uid, required this.name, required this.favorites });

}