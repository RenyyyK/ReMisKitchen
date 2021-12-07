import 'package:flutter/material.dart';
import 'package:remi_kitchen/authentication/auth_screen.dart';

import '../recipe_page.dart';

class PagesMenu extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(          children: [
            InkWell(
                onTap: () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return AuthScreen();
                      }))
                    },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text('Authentication'),
                )),
            
          ],
        );
  }
}