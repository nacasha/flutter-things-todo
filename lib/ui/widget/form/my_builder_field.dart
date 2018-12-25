import 'package:flutter/material.dart';

class MyBuilderField extends StatefulWidget {
  final Function onTap;
  final Function builder;
  final String initialText;
  final TextEditingController controller;

  MyBuilderField({
    this.onTap,
    this.builder,
    this.controller,
    this.initialText = ''
  });

  @override
  MyBuilderFieldState createState() => MyBuilderFieldState();
}

class MyBuilderFieldState extends State<MyBuilderField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(
      text: widget.initialText
    );
  }

  changeValue(value) {
    _controller.text = value;
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                color: Colors.grey.shade300
              ))
            ),
            constraints: BoxConstraints.expand(height: 55),
            child: Builder(builder: widget.builder),
          )
        ),
      ),
    );
  }
}
