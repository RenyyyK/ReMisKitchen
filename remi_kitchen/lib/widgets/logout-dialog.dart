import 'package:flutter/material.dart';
import 'package:remi_kitchen/providers/auth.dart';

class LogoutDialog extends StatelessWidget {

  final Auth auth;

  LogoutDialog({required this.auth});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      title: const Text('Log out'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Do you really want to log out?\n"),
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColorLight,
          child: const Text('No'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          color: Theme.of(context).primaryColorDark,
        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
            auth.logout();
          },
          textColor: Theme.of(context).primaryColorLight,
          child: const Text('Yes'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          color: Theme.of(context).primaryColorDark,
        ),
      ],
    );
  }
}