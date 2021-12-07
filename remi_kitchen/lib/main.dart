// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:remi_kitchen/authentication/auth_screen.dart';
import 'package:remi_kitchen/home_page.dart';
import 'package:remi_kitchen/recipe_page.dart';

void main() => runApp(RemisKitchen());

class RemisKitchen extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RemisKitchen',
      home: HomePage(),
    );
  }
}
