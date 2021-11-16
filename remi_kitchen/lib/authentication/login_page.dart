import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/wallpaper.png"),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
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