import 'package:flutter/material.dart';
import 'package:remi_kitchen/authentication/login_page.dart';
import 'package:remi_kitchen/authentication/signup_page.dart';

import '../recipe_page.dart';

class PagesMenu extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(          children: [
            InkWell(
                onTap: () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return LoginPage();
                      }))
                    },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text('Login Page'),
                )),
            InkWell(
                onTap: () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return SignupPage();
                      }))
                    },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text('Signup Page'),
                )),
            InkWell(
                onTap: () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return RecipePage();
                      }))
                    },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text('Reciepe Page'),
                )),
            
          ],
        );
  }
}