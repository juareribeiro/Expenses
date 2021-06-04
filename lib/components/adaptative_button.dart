import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const AdaptativeButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final tm = Theme.of(context);
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            color: tm.primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              onPrimary: tm.textTheme.button.color,
              primary: tm.primaryColor,
            ),
            onPressed: onPressed,
            child: Text(label),
          );
  }
}
