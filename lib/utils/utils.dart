import 'package:flutter/material.dart';

class Utils {
  showSnackBar(BuildContext context, message, {backgroundColor}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: backgroundColor,
      content: Text(message),
      duration: Duration(seconds: 3),
    ));
  }
}