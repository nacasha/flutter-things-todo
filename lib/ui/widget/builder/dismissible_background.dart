import 'package:flutter/material.dart';

class DismissibleBackground extends StatelessWidget {
  DismissibleBackground({
    this.color,
    this.icon,
    this.text,
    this.alignment,
  });

  final Color color;
  final IconData icon;
  final String text;
  final MainAxisAlignment alignment;

  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: alignment,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white
              ),
            )
          ],
        ),
      )
    );
  }
}
