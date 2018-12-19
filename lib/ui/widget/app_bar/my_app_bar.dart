import 'package:flutter/material.dart';

import 'base_app_bar.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    this.key,
    this.context,
    this.title = BaseAppBar.defaultTitle,
    this.bottomBody = BaseAppBar.defaultBottom,
    this.bottomHeight = 0,
    this.elevation = 4,
    this.pinned = true,
    this.hideSearchBar = false,
    this.actionButtons = BaseAppBar.defaultActions,
  }) : assert(context != null, 'Provide context params to MyAppBar'),
       super(key: key);

  final Key key;

  final bool hideSearchBar;
  final bool pinned;
  final BuildContext context;
  final double bottomHeight;
  final double elevation;
  final Widget bottomBody;
  final Widget title;
  final List actionButtons;

  /// [Must] override this when override [bottom]
  ///
  /// Copied from app_bar.dart line 161
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
    (action) => BaseAppBar.actions(context)[action]
  ).toList();
}
