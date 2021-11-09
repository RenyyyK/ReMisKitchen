import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
            Icon(Icons.search),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.favorite),
            ),
            Icon(Icons.account_circle_outlined),
          ],
          backgroundColor: Color(0xffa4dfa7),
      ),
      body: Text("Home Page"),
    );
  }
}