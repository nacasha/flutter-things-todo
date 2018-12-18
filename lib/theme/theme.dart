import 'package:flutter/material.dart';
import './colors.dart';

final ThemeData theme = ThemeData(
  // Define the default Brightness and Colors
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  accentColor: Colors.cyan[600],
  scaffoldBackgroundColor: Colors.white,
  buttonColor: kPrimaryColor,

  // Define the default Font Family
  // fontFamily: 'Montserrat',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    // headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    // title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    // body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),

  // Define the default InputDecorator Theme
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
    labelStyle: TextStyle(
      color: Colors.grey.shade600
    ),
    filled: true,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10
    ),
    fillColor: Colors.white,
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(0),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(0),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(0),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue.shade300),
      borderRadius: BorderRadius.circular(0),
    ),
    focusedErrorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(0),
    ),
  )
);
