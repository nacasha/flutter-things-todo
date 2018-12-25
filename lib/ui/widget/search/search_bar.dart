import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:thingstodo/theme/colors.dart';

import 'search_bar_delegate.dart';

class SearchBar extends StatefulWidget {
  final BuildContext context;
  final Function onTap;

  const SearchBar({ this.context, this.onTap });

  @override
  SearchBarState createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  final SearchBarDelegate searchBarDelegate = SearchBarDelegate();

  Widget build(BuildContext context) {
    final searchInput = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Search Task',
              style: TextStyle(
                fontSize: 15
              ),
            ),
          )
        ),
        Padding(
          padding: EdgeInsets.only(right: 17),
          child: Icon(
            FontAwesomeIcons.search,
            color: kPrimaryColor,
          ),
        )
      ],
    );

    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3)
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        child: InkWell(
          onTap: () {
            showSearch(
              context: context,
              delegate: searchBarDelegate
            );
          },
          child: searchInput,
        ),
      )
    );
  }
}
