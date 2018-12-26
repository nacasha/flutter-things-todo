import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'theme/theme.dart';
import 'ui/home/home_page.dart';
import 'redux/app/app_state.dart';



class ThingsTodo extends StatefulWidget {
  final Store<AppState> store;

  const ThingsTodo({Key key, this.store}) : super(key: key);

  @override
  ThingsTodoState createState() => ThingsTodoState();
}

class ThingsTodoState extends State<ThingsTodo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: HomePage(),
      ),
    );
  }
}
