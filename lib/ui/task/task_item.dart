import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/show_snack_bar.dart';
import 'package:thingstodo/ui/widget/builder/dismissible_background.dart';

import 'task_vm.dart';
import 'pages/task_detail_page.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this.task);

  final TaskModel task;

  onTaskDismissed(direction, context, TaskVM vm) {
    TaskStatus updates;
    Color snackbarColor;
    Text snackbarContent;

    switch(direction) {
      case DismissDirection.startToEnd:
        snackbarContent = Text('Marked as Done');
        snackbarColor = kSuccessColor;
        updates = TaskStatus.done;
        break;
      case DismissDirection.endToStart:
        snackbarContent = Text('Marked as Later');
        snackbarColor = kErrorColor;
        updates = TaskStatus.later;
        break;
    }

    showSnackBar(
      context: context,
      content: snackbarContent,
      backgroundColor: snackbarColor,
    );

    vm.updateTask(task, task.rebuild((b) => b
      ..status = updates
    ));
  }

  onTaskStarPressed(vm) {
    vm.updateTask(task, task.rebuild((b) => b
      ..important = !task.important
    ));
  }

  onTaskPressed(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => TaskDetailPage(
          task: task,
          previousContext: context,
        )
      )
    );
  }

  Widget build(BuildContext context) {
    // Store connector
    final connector = (builder) => StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      builder: builder
    );

    // Dismissible background
    final Widget background = (
      DismissibleBackground(
        text: 'Done',
        color: kSuccessColor,
        icon: FontAwesomeIcons.clipboardCheck,
        alignment: MainAxisAlignment.start,
      )
    );

    // Dismissible secondary background
    final Widget secondaryBackground = (
      DismissibleBackground(
        text: 'Later',
        color: kErrorColor,
        icon: FontAwesomeIcons.solidClock,
        alignment: MainAxisAlignment.end,
      )
    );

    return connector(
      (BuildContext context, TaskVM vm) {
        return Dismissible(
          key: Key(task.taskId),
          background: background,
          secondaryBackground: secondaryBackground,
          onDismissed: (direction) {
            onTaskDismissed(direction, context, vm);
          },
          child: InkWell(
            onTap: () { onTaskPressed(context); },
            child: Container(
              decoration: BoxDecoration(border: Border(
                bottom: BorderSide(color: Colors.grey.shade300)
              )),
              child: buildListTile(vm)
            ),
          )
        );
      }
    );
  }

  Widget buildListTile(TaskVM vm) {
    Color iconColor(priority) {
      switch (priority) {
        case TaskPriority.p1: return kSuccessColor;
        case TaskPriority.p2: return kInfoColor;
        case TaskPriority.p3: return kWarningColor;
        case TaskPriority.p4: return kErrorColor;
        default: return kSuccessColor;
      }
    };

    // Priority Icon
    final priorityIcon = Padding(
      padding: EdgeInsets.only(left: 10),
      child: Icon(
        FontAwesomeIcons.solidCircle,
        size: 20,
        color: iconColor(task.priority),
      ),
    );

    // Star Button Icon
    final starIcon = IconButton(
      icon: Icon(
        (task.important
          ? FontAwesomeIcons.solidStar
          : FontAwesomeIcons.star
        ),
        size: 20,
        color: task.important ? Colors.yellow : Colors.grey,
      ),
      onPressed: () { onTaskStarPressed(vm); }
    );

    DateTime taskDate = task.date.toLocal();
    String time = new DateFormat('hh:mm').format(taskDate);
    String amPm = new DateFormat('a').format(taskDate);
    TextStyle textStyle = TextStyle(height: 1.3, color: Colors.grey.shade900);

    final dateTime = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '$time\n',
            style: textStyle,
          ),
          TextSpan(
            text: amPm,
            style: textStyle.copyWith(
              fontWeight: FontWeight.bold
            ),
          )
        ]
      ),
    );

    final CategoryModel category = vm.categories.firstWhere((category) => (
      category.categoryId == task.categoryId
    ), orElse: ()  => (
      CategoryModel((b) => b
        ..categoryId = '0'
        ..title = 'Uncategorized'
      )
    ));

    // List Tile
    return ListTile(
      subtitle: Text(category.title),
      title: Text(task.title),
      leading: dateTime,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          starIcon,
          priorityIcon
        ],
      )
    );
  }
}
