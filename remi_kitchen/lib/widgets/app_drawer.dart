import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: Text('Search for ingredients'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
      ],
    ));
  }
}
