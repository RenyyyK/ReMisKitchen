// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:remi_kitchen/authentication/signup_page.dart';
import 'package:remi_kitchen/home_page.dart';
import 'package:remi_kitchen/recipe_page.dart';

import 'authentication/login_page.dart';

void main() => runApp(RemisKitchen());

class RemisKitchen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), //SignupPage()
      // home: Scaffold(
      //   appBar: AppBar(
      //     actions: [
      //       Icon(Icons.search),
      //       Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 16),
      //         child: Icon(Icons.favorite),
      //       ),
      //       Icon(Icons.account_circle_outlined),
      //     ],
      //     backgroundColor: Color(0xffa4dfa7),
      //   ),
      //   body: Container(
      //           constraints: BoxConstraints.expand(),
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage("images/wallpaper.png"),
      //                   fit: BoxFit.cover)),
      //           child: Row(
      //             children: <Widget>[
      //               RaisedButton(
      //                 child: Text("Recipe Page"),
      //                 onPressed: () {
      //                   Navigator.of(context).push(
      //                     MaterialPageRoute(
      //                       builder: (_) {
      //                         return RecipePage();
      //                       },
      //                     ),
      //                   );
      //                 },
      //               ),
      //               RaisedButton(
      //                 child: Text("Home Page"),
      //                 onPressed: () {
      //                   Navigator.of(context).push(
      //                     MaterialPageRoute(
      //                       builder: (_) {
      //                         return HomePage();
      //                       },
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ]
      //           ),
      //         ),
      //   ),
    );
  }
}
