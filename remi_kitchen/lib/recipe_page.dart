import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  static const routeName = '/recipe-page';

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
      body: const Text("Recipe 1"),
    );
  }
}