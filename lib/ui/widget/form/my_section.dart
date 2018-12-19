import 'package:flutter/material.dart';

class MySection extends StatelessWidget {
  final String text;

  MySection({
    this.text,
  });

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300
          )
        )
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10
      ),
      child: Text(text, style: TextStyle(
          fontSize: 13,
        ),
      )
    );
  }
}
