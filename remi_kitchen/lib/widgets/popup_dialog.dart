import 'package:flutter/material.dart';

class PopupDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      title: const Text('Adjust ingredients'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
              "If you would like to change the measurement for an ingredient, we will adjust the other ingredients according to that.\n"),
          Text("For adjusting, click on the ingredient you want to change.\n"),
          Text(
              "Please note, that you can adjust only the ingredients that have a measuring unit.\n"),
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColorLight,
          child: const Text('OK'),
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
