import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget {
  final String title;
  final String initialText;
  final Widget confirmText;
  final Function confirmOnTap;

  InputDialog({
    this.title,
    this.initialText,
    this.confirmText,
    this.confirmOnTap,
  });

  @override
  InputDialogState createState() => InputDialogState();
}

class InputDialogState extends State<InputDialog> {
  TextEditingController inputController;

  @override
  void initState() {
    super.initState();

    inputController = TextEditingController(
      text: widget.initialText
    );
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      contentPadding: EdgeInsets.only(
        left: 18,
        right: 18,
        top: 24
      ),
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextFormField(
              controller: inputController,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black
              ),
              autofocus: true,
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.all(10)
              ),
              onFieldSubmitted: (value) {
                widget.confirmOnTap(inputController.text);
              },
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: widget.confirmText,
          onPressed: () {
            widget.confirmOnTap(inputController.text);
          },
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
