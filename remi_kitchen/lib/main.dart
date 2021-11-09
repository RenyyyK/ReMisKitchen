// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() => runApp(RemisKitchen());

class RemisKitchen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/wallpaper.png"),
                        fit: BoxFit.cover)),
                child: TextField(decoration: InputDecoration(fillColor: Color(0xffa4dfa7),filled: true),)),
      ),
    );
  }
}
