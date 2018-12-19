import 'package:flutter/material.dart';

class MyCustomField extends StatefulWidget {
  final String labelText;
  final String initialText;
  TextEditingController controller;

  MyCustomField({
    this.controller,
    this.labelText,
    this.initialText = ''
  });

  @override
  MyBuilderField createState() => MyBuilderField();
}

class MyBuilderField extends State<MyCustomField> {
  @override
  void initState() {
    super.initState();
    widget.controller = new TextEditingController(
      text: widget.initialText
    );
  }

  changeValue(value) {
    widget.controller.text = value;
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: TextField(
            controller: widget.controller,
            enabled: false,
            decoration: InputDecoration().copyWith(
              fillColor: Colors.transparent,
              labelText: widget.labelText,
            ),
          ),
        ),
      ),
    );
  }
}
