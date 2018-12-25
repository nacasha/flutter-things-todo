import 'package:flutter/material.dart';

showSnackBar({ context, content, backgroundColor }) {
  return Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: content,
        backgroundColor: backgroundColor,
        duration: Duration(seconds: 1)
      )
    );
}
