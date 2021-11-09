import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/wallpaper.png"),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              ),
              color: Color(0x90b57f50),
            ),
            width: 340,
            height: 600,
          ),
        ),
      ),
    );
  }
}