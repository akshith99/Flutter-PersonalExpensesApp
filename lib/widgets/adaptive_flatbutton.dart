import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AdaptiveFlatbutton extends StatelessWidget {

  final String text;
  final Function handler;

  AdaptiveFlatbutton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoButton(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: handler,
    ) :
    FlatButton(
      textColor: Theme.of(context).primaryColor,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: handler,
    );
  }
}
