import 'package:flutter/material.dart';

import '../search_bar.dart';

import 'base_app_bar.dart';

class MySliverAppBar extends SliverAppBar {
  static const Widget defaultBottom = SizedBox();
  static const Widget defaultFlexibleSpace = FlexibleSpaceBar(
    collapseMode: CollapseMode.pin,
    background: SearchBar()
  );

  MySliverAppBar({
    this.key,
    this.context,
    this.bottom,
    this.expandedHeight,
    this.title = BaseAppBar.defaultTitle,
    this.flexibleSpace = defaultFlexibleSpace,
    this.pinned = true,
    this.floating = true,
    this.forceElevated = false,
    this.actionButtons = BaseAppBar.defaultActions,
  }) : assert(context != null, 'Provide context params to MySliverAppBar'),
       super(key: key);

  final Key key;

  final bool forceElevated;
  final bool pinned;
  final bool floating;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double expandedHeight;
  final BuildContext context;
  final List actionButtons;
  final Widget title;

  @override
  List<Widget> get actions => actionButtons.map(
    (action) => BaseAppBar.actions[action]
  ).toList();
}
