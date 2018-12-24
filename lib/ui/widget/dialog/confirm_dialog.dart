import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final Widget confirmText;
  final Function confirmOnTap;

  ConfirmDialog({
    this.title,
    this.content,
    this.confirmOnTap,
    this.confirmText
  });

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: confirmText,
          onPressed: confirmOnTap
        ),
        FlatButton(
          child: Text('CLOSE'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
