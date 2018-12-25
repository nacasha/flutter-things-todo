import 'package:flutter/material.dart';

class MyCustomField extends StatefulWidget {
  final Function onTap;
  final String labelText;
  final Function validator;
  final TextEditingController controller;

  MyCustomField({
    this.controller,
    this.onTap,
    this.labelText,
    this.validator,
  });

  @override
  MyCustomFieldState createState() => MyCustomFieldState();
}

class MyCustomFieldState extends State<MyCustomField> {
  changeValue(value) {
    widget.controller.text = value;
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          child: IgnorePointer(
            ignoring: true,
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              decoration: InputDecoration().copyWith(
                fillColor: Colors.transparent,
                labelText: widget.labelText,
              ),
            ),
          )
        ),
      ),
    );
  }
}
