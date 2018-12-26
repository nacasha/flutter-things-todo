import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:thingstodo/theme/colors.dart';
import 'package:thingstodo/data/model/models.dart';
import 'package:thingstodo/redux/app/app_state.dart';
import 'package:thingstodo/ui/widget/app_bar/my_app_bar.dart';
import 'package:thingstodo/ui/widget/builder/task_badge.dart';
import 'package:thingstodo/ui/widget/dialog/confirm_dialog.dart';
import 'package:thingstodo/ui/widget/notifications/show_snack_bar.dart';

import '../task_vm.dart';
import 'task_form_page.dart';

class TaskDetailPage extends StatefulWidget {
  static final String route = '/task-detail';

  final TaskModel task;
  final BuildContext previousContext;

  TaskDetailPage({ this.task, this.previousContext });

  @override
  TaskDetailPageState createState() => TaskDetailPageState();
}

class TaskDetailPageState extends State<TaskDetailPage> {
  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    final Store<AppState> store = StoreProvider.of<AppState>(context);
    final TaskVM vm = TaskVM.fromStore(store);
  }

  onTrashAction(context, task, TaskVM vm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: 'Confirm',
          content: 'Delete this task?',
          confirmText: Text('DELETE', style: TextStyle(
            color: kErrorColor
          )),
          confirmOnTap: () {
            vm.removeTask(task);

            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        );
      }
    );
  }

  onEditAction(context, task, TaskVM vm) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext ctx) => TaskFormPage(
          previousContext: context,
          task: task,
        )
      )
    );
  }

  onLaterAction(context, task, TaskVM vm) {
    TaskStatus updates = TaskStatus.later;

    if (task.status == TaskStatus.later) {
      updates = TaskStatus.active;
    } else {
      showSnackBar(
        context: context,
        content: Text('Marked as Later'),
        backgroundColor: kErrorColor,
      );
    }

    vm.updateTask(task, task.rebuild((b) => b
      ..status = updates
    ));
  }

  onDoneAction(context, task, TaskVM vm) {
    TaskStatus updates = TaskStatus.done;

    if (task.status == TaskStatus.done) {
      updates = TaskStatus.active;
    } else {
      showSnackBar(
        context: context,
        content: Text('Marked as Done'),
        backgroundColor: kSuccessColor,
      );
    }

    vm.updateTask(task, task.rebuild((b) => b
      ..status = updates
    ));
  }

  Widget connector({ builder, rebuildOnChange }) {
    return StoreConnector<AppState, TaskVM>(
      converter: TaskVM.fromStore,
      rebuildOnChange: rebuildOnChange ?? true,
      builder: builder
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: buildBottomSheet(),
      appBar: MyAppBar(
        context: context,
        title: Text('Task Detail'),
        titleSpacing: 0,
        elevation: 0,
        actionButtons: ['notification'],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Stack(
            children: <Widget>[
              buildDecorationBox(),
              buildDetailCard()
            ],
          );
        },
      )
    );
  }

  Widget buildDecorationBox() {
    return Container(
      height: 60,
      color: kPrimaryColor,
    );
  }

  Widget buildDetailCard() {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: connector(
            builder: (BuildContext context, TaskVM vm) {
              final TaskModel task = vm.tasks.firstWhere((task) => (
                task.taskId == widget.task.taskId
              ), orElse: () => (
                widget.task
              ));

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTaskBadge(task),
                  buildTaskDetail(vm, task)
                ],
              );
            }
          )
        ),
      ],
    );
  }

  Widget buildTaskBadge(TaskModel task) {
    Color badgeColor;
    String badgeText;

    switch (task.priority) {
      case TaskPriority.p1:
        badgeColor = kSuccessColor;
        badgeText = 'To do while free';
        break;
      case TaskPriority.p2:
        badgeColor = kInfoColor;
        badgeText = 'Nice to have';
        break;
      case TaskPriority.p3:
        badgeColor = kWarningColor;
        badgeText = 'Need to be done';
        break;
      case TaskPriority.p4:
        badgeColor = kErrorColor;
        badgeText = 'Urgent';
        break;
    }

    return Align(
      alignment: Alignment.centerRight,
      child: CustomPaint(
        painter: TaskBadge(
          color: badgeColor
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 3
          ),
          child: Text(
            badgeText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ),
    );
  }

  Widget buildTaskDetail(TaskVM vm, TaskModel task) {
    final title = task.title;
    final description = task.description;
    final date = DateFormat('d MMM, yyyy | hh:mm aa').format(
      task.date.toLocal()
    );
    final CategoryModel category = vm.categories.firstWhere((category) => (
      category.categoryId == task.categoryId
    ), orElse: ()  => (
      CategoryModel((b) => b
        ..categoryId = '0'
        ..title = 'Uncategorized'
      )
    ));

    return Padding(
      padding: EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: TextStyle(
            color: Colors.black
          ),
          children: [
            TextSpan(
              text: '$title\n',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            TextSpan(
              text: '$date\n',
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.7,
              )
            ),
            TextSpan(
              text: '\n$description\n\n',
              style: TextStyle(
                color: Colors.grey.shade800,
              )
            ),
            TextSpan(
              text: 'Category: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.7
              )
            ),
            TextSpan(
              text: category.title,
            )
          ]
        ),
      )
    );
  }

  buildBottomSheet() {
    return Material(
      color: Colors.white,
      elevation: 10,
      child: connector(
        builder: (context, TaskVM vm) {
          final task = vm.tasks.firstWhere((task) => (
            task.taskId == widget.task.taskId
          ), orElse: () => widget.task );

          final bool isLater = task.status == TaskStatus.later;
          final bool isDone = task.status == TaskStatus.done;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                tooltip: 'Delete Task',
                icon: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  onTrashAction(context, task, vm);
                },
              ),
              IconButton(
                tooltip: 'Edit Task',
                icon: Icon(
                  FontAwesomeIcons.pencilAlt,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  onEditAction(context, task, vm);
                },
              ),
              IconButton(
                tooltip: 'Mark as Later',
                icon: Icon(
                  FontAwesomeIcons.clock,
                  color: isLater ? kErrorColor : Colors.grey.shade600,
                ),
                onPressed: () {
                  onLaterAction(context, task, vm);
                },
              ),
              IconButton(
                tooltip: 'Mark as Done',
                icon: Icon(
                  FontAwesomeIcons.calendarCheck,
                  color: isDone ? kSuccessColor : Colors.grey.shade600,
                ),
                onPressed: () {
                  onDoneAction(context, task, vm);
                },
              )
            ],
          );
        }
      )
    );
  }
}
