import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final bool autofocus;
  final bool autovalidate;
  final String labelText;
  final Function validator;
  final TextInputType keyboardType;
  final TextEditingController controller;

  MyInputField({
    this.labelText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.autofocus = false,
    this.autovalidate = false,
  });

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
        autofocus: autofocus,
        autovalidate: autovalidate,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
        maxLines: keyboardType == TextInputType.multiline ? null : 1,
        decoration: InputDecoration().copyWith(
          labelText: labelText,
        ),
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade800
        ),
      ),
    );
  }
}
