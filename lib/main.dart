import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'data/persistor.dart';
import 'data/middleware.dart';
import 'redux/app/app_state.dart';
import 'redux/app/app_reducers.dart';

import 'thingstodo.dart';

void main() async {
  final store = Store<AppState>(
    appReducers,
    initialState: AppState(),
    middleware: middleware
  );

  // Load initial state
  persistor.load(store);

  runApp(ThingsTodo(store: store));
}
