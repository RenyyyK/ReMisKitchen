import 'dart:math';

import 'package:flutter/material.dart';
import 'package:remi_kitchen/models/measurement.dart';

class AdjustDialog extends StatefulWidget {
  final Measurement i;
  final double? quantity;

  late double? adjustedQuantity = quantity;

  AdjustDialog(this.i, this.quantity);

  @override
  State<AdjustDialog> createState() => _AdjustDialogState();
}

class _AdjustDialogState extends State<AdjustDialog> {

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  void minus() {
    if (widget.adjustedQuantity != 0.0) {
      setState(() {
        widget.adjustedQuantity = roundDouble(widget.adjustedQuantity! - 0.1, 2);
      });
    }
  }

  void plus() {
    setState(() {
      widget.adjustedQuantity = roundDouble(widget.adjustedQuantity! + 0.1, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(32.0))),
      contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      title: Text(
        widget.i.ingredient.name + "\n\n",
        style: TextStyle(
            color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),
      ),
      content: Container(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  minus();
                }),
            Text(
              widget.adjustedQuantity.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).shadowColor,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                  plus();
              },
            ),
            Text(
              "  " + widget.i.ingredient.unitOfMeasurement.name,
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).shadowColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.pop(context, widget.adjustedQuantity);
          },
          textColor: Theme.of(context).primaryColorLight,
          child: const Text('Adjust'),
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
