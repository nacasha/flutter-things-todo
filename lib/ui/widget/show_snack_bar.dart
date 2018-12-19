import 'package:flutter/material.dart';

showSnackBar({ context, content, backgroudColor }) {
  return Scaffold.of(context).showSnackBar(
    SnackBar(
      content: content,
      backgroundColor: backgroudColor,
      duration: Duration(seconds: 1)
    )
  );
}
