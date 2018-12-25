import 'package:flutter/material.dart';

import 'base_app_bar.dart';

class MySliverAppBar extends SliverAppBar {
  static const Widget defaultBottom = SizedBox();

  MySliverAppBar({
    this.key,
    this.context,
    this.callback,
    this.bottom,
    this.flexibleSpace,
    this.expandedHeight,
    this.snap = false,
    this.pinned = false,
    this.floating = false,
    this.forceElevated = false,
    this.title = BaseAppBar.defaultTitle,
    this.actionButtons = BaseAppBar.defaultActions,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
  }) : assert(context != null, 'Provide context params to MySliverAppBar'),
       super(key: key);

  final Key key;

  final bool forceElevated;
  final bool pinned;
  final bool floating;
  final bool snap;
  final bool primary = true;
  final double titleSpacing;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double expandedHeight;
  final BuildContext context;
  final List actionButtons;
  final Widget title;
  final Function callback;

  @override
  List<Widget> get actions => actionButtons.map(
    (action) => BaseAppBar.actions(context, callback)[action]
  ).toList();
}
