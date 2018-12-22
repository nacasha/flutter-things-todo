import 'package:flutter/material.dart';

import 'package:thingstodo/ui/task/task_form_page.dart';

import '../search_bar.dart';

/// [BaseAppBar] contains all default values and default builder
/// for [MyAppBar] and [MySliverAppbar] to maintain consistency
/// between all custom Appbar
class BaseAppBar {

  /// [Default values constructor] for App Bar
  static const Widget defaultTitle = Text('Things Todo');
  static const List defaultActions = ['notification', 'add'];
  static const Widget defaultBottom = SizedBox();

  /// [Default preferredSize] for App Bar
  static Size preferredSize(bottom) => Size.fromHeight(
    kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)
  );

  /// [Default actions] for App Bar
  static Map<String, Widget> actions(context, callback) => <String, Widget>{
    'notification': _buildActionButton(
      icon: Icons.notifications,
      tooltip: 'Notifications',
      onPressed: () {
        Navigator.of(context).pushNamed('/task-form');
      }
    ),
    'add': _buildActionButton(
      icon: Icons.add,
      tooltip: 'Add new Task',
      onPressed: () async {
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => TaskFormPage(previousContext: context),
          ),
        );

        if (callback != null) callback(result);
      }
    )
  };

  /// [Default bottom] for in App Bar
  static PreferredSizeWidget bottom({hideSearchBar, bottomHeight, bottomBody}) {
    return PreferredSize(
      preferredSize: Size.fromHeight((hideSearchBar ? 0 : 65) + bottomHeight),
      child: Column(
        children: <Widget>[
          hideSearchBar ? Container() : SearchBar(),
          bottomBody
        ],
      ),
    );
  }

  /// [Create actions] for App Bar
  static Widget _buildActionButton({icon, tooltip, onPressed}) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 30,
      tooltip: tooltip,
      onPressed: onPressed
    );
  }
}
