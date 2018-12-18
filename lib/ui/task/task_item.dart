import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/builder/dismissible_background.dart';

import 'task_vm.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this.task);

  final TaskModel task;

  Widget build(BuildContext context) {
    final Widget background = (
      DismissibleBackground(
        text: 'Done',
        color: kSuccessColor,
        icon: FontAwesomeIcons.clipboardCheck,
        alignment: MainAxisAlignment.start,
      )
    );

    final Widget secondaryBackground = (
      DismissibleBackground(
        text: 'Later',
        color: kErrorColor,
        icon: FontAwesomeIcons.solidClock,
        alignment: MainAxisAlignment.end,
      )
    );

    final connector = (builder) => StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      rebuildOnChange: false,
      builder: builder
    );

    return connector(
      (BuildContext context, TaskVM vm) {
        return Dismissible(
          key: Key(task.taskId),
          background: background,
          secondaryBackground: secondaryBackground,
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              return vm.removeTask(task);
            }
            return vm.removeTask(task);
          },
          child: ListTile(
            subtitle: Text('Family'),
            title: Text('Jalan - jalan'),
            leading: Text('ni'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(FontAwesomeIcons.star, size: 20),
                Icon(FontAwesomeIcons.star, size: 20),
              ],
            )
          ),
        );
      }
    );
  }
}
