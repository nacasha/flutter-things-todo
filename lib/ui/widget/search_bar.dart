import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:thingstodo/theme/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar();

  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white)
    );

    final decoration = InputDecoration(
      labelText: 'Search Task',
      hasFloatingPlaceholder: false,
      fillColor: Colors.transparent,
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      contentPadding: EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 17
      ),
    );

    final searchInput = Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: decoration,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black
            ),
          ),
        ),
        Icon(
          FontAwesomeIcons.search,
          color: kPrimaryColor,
        )
      ],
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 50,
        padding: EdgeInsets.only(right: 17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3)
        ),
        child: searchInput
      )
    );
  }
}
