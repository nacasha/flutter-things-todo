import 'package:flutter/material.dart';

import 'base_app_bar.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    this.key,
    this.context,
    this.callback,
    this.elevation = 4,
    this.pinned = true,
    this.bottomHeight = 0,
    this.hideSearchBar = false,
    this.bottomBody = BaseAppBar.defaultBottom,
    this.title = BaseAppBar.defaultTitle,
    this.actionButtons = BaseAppBar.defaultActions,
  }) : assert(context != null, 'Provide context params to MyAppBar'),
       super(key: key);

  final Key key;

  final bool hideSearchBar;
  final bool pinned;
  final BuildContext context;
  final double bottomHeight;
  final double elevation;
  final Function callback;
  final List actionButtons;
  final Widget bottomBody;
  final Widget title;

  @override
  Size get preferredSize => BaseAppBar.preferredSize(bottom);

  @override
  PreferredSizeWidget get bottom => BaseAppBar.bottom(
    bottomBody: bottomBody,
    bottomHeight: bottomHeight,
    hideSearchBar: hideSearchBar,
  );

  @override
  List<Widget> get actions => actionButtons.map(
    (action) => BaseAppBar.actions(context, callback)[action]
  ).toList();
}
