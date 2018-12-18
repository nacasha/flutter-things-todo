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
        vertical: 16,
        horizontal: 20
      ),
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: 15,
        left: 15,
        right: 15
      ),
      child: TextField(
        decoration: decoration
      ),
    );
  }
}
