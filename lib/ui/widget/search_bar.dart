import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar();

  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white)
    );

    final decoration = InputDecoration(
      labelText: 'Search Task',
      hasFloatingPlaceholder: false,
      fillColor: Colors.white,
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      contentPadding: EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 17
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: TextField(
        decoration: decoration,
        style: TextStyle(
          fontSize: 17,
          color: Colors.black
        ),
      ),
    );
  }
}
